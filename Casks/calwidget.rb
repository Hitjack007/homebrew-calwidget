cask "calwidget" do
  version "27.0"
  sha256 "6944bbfbc9312944bcfb8e36fc09d5d78e40086b88119bc94de8a7e6b79f361a"

  url "https://github.com/Hitjack007/CalWidget/releases/download/v27.0/CalWidget-27.0.dmg"
  name "CalWidget"
  desc "Month view of your Google Calendar as a macOS widget"
  homepage "https://gcalwidget.marksstuff.com"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :tahoe

  app "CalWidget.app"

  # Clears the quarantine flag so macOS doesn't show its security warning on first open.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/CalWidget.app"]
  end

  uninstall quit: "com.hitjack007.calwidget"

  zap trash: [
    "~/Library/Application Scripts/com.hitjack007.calwidget",
    "~/Library/Application Scripts/com.hitjack007.calwidget.widget",
    "~/Library/Containers/com.hitjack007.calwidget",
    "~/Library/Containers/com.hitjack007.calwidget.widget",
    "~/Library/Group Containers/*.com.hitjack007.calwidget",
  ]
end
