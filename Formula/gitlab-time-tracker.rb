require "language/node"

class GitlabTimeTracker < Formula
  desc "Command-line interface for GitLab's time tracking feature"
  homepage "https://github.com/kriskbx/gitlab-time-tracker"
  url "https://github.com/kriskbx/gitlab-time-tracker/releases/download/1.7.40/gtt-macos"
  sha256 "3fb512e551c15e4edf84cff874a2d3caf79e57d56c4f918c9126afeeab036985"

  bottle :unneeded

  depends_on "node" => :optional

  def install
    bin.install "gtt-macos" => "gtt"
  end

  test do
    assert_match '/.*Resolving "gitlab"....*\nError: Invalid access token!/', shell_output("#{bin}/gtt report gitlab")
  end
end