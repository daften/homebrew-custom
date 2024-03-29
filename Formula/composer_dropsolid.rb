class ComposerDropsolid < Formula
  desc "Dependency Manager for PHP, pinned to 1.6.5"
  homepage "https://getcomposer.org/"
  url "https://getcomposer.org/download/1.6.5/composer.phar"
  sha256 "67bebe9df9866a795078bb2cf21798d8b0214f2e0b2fd81f2e907a8ef0be3434"

  def install
    bin.install "composer.phar" => "composer1.6.5"
  end

  test do
    (testpath/"composer.json").write <<~EOS
      {
        "name": "homebrew/test",
        "authors": [
          {
            "name": "Homebrew"
          }
        ],
        "require": {
          "php": ">=5.3.4"
          },
        "autoload": {
          "psr-0": {
            "HelloWorld": "src/"
          }
        }
      }
    EOS

    (testpath/"src/HelloWorld/greetings.php").write <<~EOS
      <?php

      namespace HelloWorld;

      class Greetings {
        public static function sayHelloWorld() {
          return 'HelloHomebrew';
        }
      }
    EOS

    (testpath/"tests/test.php").write <<~EOS
      <?php

      // Autoload files using the Composer autoloader.
      require_once __DIR__ . '/../vendor/autoload.php';

      use HelloWorld\\Greetings;

      echo Greetings::sayHelloWorld();
    EOS

    system "#{bin}/composer1.6.5", "install"
    assert_match /^HelloHomebrew$/, shell_output("php tests/test.php")
  end
end
