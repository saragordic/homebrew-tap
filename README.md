# Homebrew tap

Casks for [Window Sweaters](https://github.com/saragordic/window-sweaters) and [Rooms](https://github.com/saragordic/rooms).

```sh
brew trust saragordic/tap
brew install --cask saragordic/tap/window-sweaters
brew install --cask saragordic/tap/rooms
```

Homebrew refuses to load casks from third-party taps until you trust them, so
the first command is required.

The app opens straight away, with no security prompt. It is ad-hoc signed rather
than notarized by Apple, so the cask clears the quarantine flag that Homebrew
attaches to every download, including when you pass a custom `--appdir`. If macOS
does still ask, approve it once in System Settings → Privacy & Security.

To update or remove:

```sh
brew upgrade --cask window-sweaters
brew uninstall --cask window-sweaters
```
