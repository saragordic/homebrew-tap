cask "window-sweaters" do
  version "1.4.29"
  sha256 "ea498625aa87847045b3287b76fc863b8b19aa715d672f65e6433d4cab64a0e2"

  url "https://github.com/saragordic/window-sweaters/releases/download/v#{version}/WindowSweaters-#{version}.zip"
  name "Window Sweaters"
  desc "Menu-bar app that wraps windows in knitted borders coloured after each app"
  homepage "https://github.com/saragordic/window-sweaters"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Window Sweaters.app"

  # Homebrew always quarantines cask downloads and no longer offers an opt-out.
  # The app is ad-hoc signed rather than notarized, so without this the user is
  # sent to System Settings on first launch to approve an app they just asked
  # Homebrew to install.
  postflight_steps do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Window Sweaters.app"]
  end

  zap trash: [
    "~/Library/Application Support/Knit Borders",
    "~/Library/Preferences/local.knitborders.app.plist",
  ]
end
