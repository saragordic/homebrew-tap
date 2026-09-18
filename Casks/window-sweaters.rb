cask "window-sweaters" do
  version "1.5.0"
  sha256 "6777354004ac1c0fae697824fc4f3f36bdb9a16f0a1c6ea24a70d64205e5a52e"

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
  # chdir resolves against the real --appdir, so a custom location still works.
  postflight_steps(default_base: :appdir) do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "Window Sweaters.app"],
        chdir:          ".",
        writable_paths: ["Window Sweaters.app"],
        must_succeed:   false
  end

  zap trash: [
    "~/Library/Application Support/Knit Borders",
    "~/Library/Preferences/local.knitborders.app.plist",
  ]
end
