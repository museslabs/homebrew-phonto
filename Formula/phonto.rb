class Phonto < Formula
  desc "GPU-accelerated video wallpaper for Wayland compositors and macOS"
  homepage "https://github.com/museslabs/phonto"
  version "0.3.1"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/museslabs/phonto/releases/download/v0.3.1/phonto-darwin-aarch64.tar.gz"
      sha256 "68e355525ac662834039c6e9561a574f06525d0fa4b227780fa909c375fc011c"
    end

    on_intel do
      url "https://github.com/museslabs/phonto/releases/download/v0.3.1/phonto-darwin-x86_64.tar.gz"
      sha256 "0e456852a2b7addab8afdffd5f2e4d1bacb60e6796fe4e26377c69eac551d2d6"
    end
  end

  on_linux do
    depends_on "gstreamer"

    on_intel do
      url "https://github.com/museslabs/phonto/releases/download/v0.3.1/phonto-linux-x86_64.tar.gz"
      sha256 "dcef814eefc5faa5d55d386770884f6cf0de34dcf26d3c4967d30f4c63ad9e6e"
    end

    on_arm do
      url "https://github.com/museslabs/phonto/releases/download/v0.3.1/phonto-linux-x86_64.tar.gz"
      sha256 "dcef814eefc5faa5d55d386770884f6cf0de34dcf26d3c4967d30f4c63ad9e6e"
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
