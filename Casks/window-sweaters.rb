cask "window-sweaters" do
  version "1.4.31"
  sha256 "c1acdbc56dafa3efa1d8d6f86af2a4e9d6664bf798642ebdffdce5860366d0c7"

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
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "Window Sweaters.app"],
        chdir:          { "path" => ".", "base" => "appdir" },
        writable_paths: ["Window Sweaters.app"],
        writable_base:  "appdir",
        must_succeed:   false
  end

  zap trash: [
    "~/Library/Application Support/Knit Borders",
    "~/Library/Preferences/local.knitborders.app.plist",
  ]
end
