# Homebrew tap

Casks for [Window Sweaters](https://github.com/saragordic/window-sweaters).

```sh
brew install --cask --no-quarantine saragordic/tap/window-sweaters
```

`--no-quarantine` skips the first-launch security prompt. The app is ad-hoc
signed rather than notarized by Apple, so without that flag macOS asks you to
approve it once in System Settings → Privacy & Security.

To update or remove:

```sh
brew upgrade --cask window-sweaters
brew uninstall --cask window-sweaters
```
