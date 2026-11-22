# homebrew-ytd

Homebrew tap for [ytd](https://github.com/xvoland/ytd) — a terminal video
downloader where the thumbnail itself is the progress bar.

## Install

```bash
brew tap xvoland/ytd
brew install ytd
```

On macOS the binary is ad-hoc signed at install time and any quarantine
attribute is removed, so Gatekeeper does not block it.

## Update

The `update-tap` job in the `xvoland/ytd` repository updates `url`, `sha256`
and `version` in `Formula/ytd.rb` on every `v*` tag push.
