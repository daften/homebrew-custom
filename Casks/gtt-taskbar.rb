cask 'gtt-taskbar' do
  version '0.3.10'
  sha256 '504d6147cbf054794ada4f9a0b19aaf3a9d0169162a7c086092eeab54f88ade2'

  url "https://github.com/kriskbx/gitlab-time-tracker-taskbar/releases/download/v#{version}/gtt-taskbar-darwin-x64-#{version}.zip"
  appcast 'https://github.com/krisbx/gitlab-time-tracker-taskbar/releases.atom'
  name 'Gitlab time tracker taskbar'
  homepage 'https://github.com/kriskbx/gitlab-time-tracker-taskbar'

  app 'gtt-taskbar.app'
end