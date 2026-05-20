class Phonto < Formula
  desc "GPU-accelerated video wallpaper for Wayland compositors and macOS"
  homepage "https://github.com/museslabs/phonto"
  version "0.3.2"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/museslabs/phonto/releases/download/v0.3.2/phonto-darwin-aarch64.tar.gz"
      sha256 "15bf7e0141e843f2c9e567f182a1a1122b8cfe0fa819c9e01d3c44bc9d506483"
    end

    on_intel do
      url "https://github.com/museslabs/phonto/releases/download/v0.3.2/phonto-darwin-x86_64.tar.gz"
      sha256 "999e78ed9d6f30d6d1861579a6255a37a23c56ff5eb118bc71c848213f3c862a"
    end
  end

  on_linux do
    depends_on "gstreamer"

    on_intel do
      url "https://github.com/museslabs/phonto/releases/download/v0.3.2/phonto-linux-x86_64.tar.gz"
      sha256 "9a294a826a5740195200ed2084080da1d798ca42d74b4d84287f856cca933c00"
    end

    on_arm do
      url "https://github.com/museslabs/phonto/releases/download/v0.3.2/phonto-linux-x86_64.tar.gz"
      sha256 "9a294a826a5740195200ed2084080da1d798ca42d74b4d84287f856cca933c00"
    end
  end

  def install
    odie "phonto does not yet provide ARM Linux binaries." if OS.linux? && Hardware::CPU.arm?
    bin.install "phonto"
  end

  test do
    assert_match "phonto", shell_output("#{bin}/phonto --help")
  end
end
