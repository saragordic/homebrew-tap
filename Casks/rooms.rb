cask "rooms" do
  version "1.0.0"
  sha256 "30bd01202ca5673f3f2a50b9821ed679c0a635704a34e8e51d1c1e36a2df9a8e"

  url "https://github.com/saragordic/rooms/releases/download/v#{version}/Rooms-#{version}.zip"
  name "Rooms"
  desc "Menu-bar app that switches between projects, each a set of windows and a layout"
  homepage "https://github.com/saragordic/rooms"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Rooms.app"

  # Homebrew always quarantines cask downloads and no longer offers an opt-out.
  # The app is ad-hoc signed rather than notarized, so without this the user is
  # sent to System Settings to approve an app they just asked Homebrew to install.
  # chdir resolves against the real --appdir, so a custom location still works.
  postflight_steps(default_base: :appdir) do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "Rooms.app"],
        chdir:          ".",
        writable_paths: ["Rooms.app"],
        must_succeed:   false
  end

  uninstall quit: "com.saragordic.rooms"

  zap trash: [
    "~/Library/Application Support/Rooms",
    "~/Library/Logs/Rooms",
    "~/Library/Preferences/com.saragordic.rooms.plist",
  ]
end
