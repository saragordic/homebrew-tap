# Homebrew tap

Casks for [Window Sweaters](https://github.com/saragordic/window-sweaters).

```sh
brew trust saragordic/tap
brew install --cask --no-quarantine saragordic/tap/window-sweaters
```

Homebrew refuses to load casks from third-party taps until you trust them, so
the first command is required. `--no-quarantine` skips the first-launch security
prompt: the app is ad-hoc signed rather than notarized by Apple, and without
that flag macOS asks you to approve it once in System Settings → Privacy &
Security.

To update or remove:

```sh
brew upgrade --cask window-sweaters
brew uninstall --cask window-sweaters
```
