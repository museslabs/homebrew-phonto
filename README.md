# homebrew-phonto

Homebrew tap for [phonto](https://github.com/museslabs/phonto), a GPU-accelerated video wallpaper program for Wayland compositors and macOS.

## Install

```bash
brew install museslabs/phonto/phonto
```

Or tap first:

```bash
brew tap museslabs/phonto
brew install phonto
```

## Platform support

| Platform              | Status    |
| --------------------- | --------- |
| macOS (Apple Silicon) | supported |
| macOS (Intel)         | supported |
| Linux (x86_64)        | supported |

On Linux, `gstreamer` and `gst-plugins-base` are pulled in as dependencies. For GPU-accelerated decoding you'll still want the distro VA-API plugin (`gst-plugin-va` / `gstreamer1.0-vaapi` / `gstreamer1-vaapi`) installed via your system package manager. Homebrew on Linux does not ship VA-API drivers.

## Bumping the formula

After a new `phonto` release is published:

```bash
V=0.3.0  # new version, no leading v
for asset in phonto-darwin-aarch64.tar.gz phonto-darwin-x86_64.tar.gz phonto-linux-x86_64.tar.gz; do
  sha=$(curl -fsSL "https://github.com/museslabs/phonto/releases/download/v$V/$asset" | shasum -a 256 | cut -d' ' -f1)
  printf "%-32s %s\n" "$asset" "$sha"
done
```

Edit `Formula/phonto.rb`: update `version`, all three `url`s, and all three `sha256` values. Then:

```bash
brew audit --strict --new Formula/phonto.rb
brew install --build-from-source Formula/phonto.rb
brew test phonto
```

Commit, push, done.
