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
  # sent to System Settings to approve an app they just asked Homebrew to install.
  # must_succeed is false so a non-default --appdir does not fail the install.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "/Applications/Window Sweaters.app"],
        must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/Knit Borders",
    "~/Library/Preferences/local.knitborders.app.plist",
  ]
end
