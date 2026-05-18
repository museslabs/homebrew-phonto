class Phonto < Formula
  desc "GPU-accelerated video wallpaper for Wayland compositors and macOS"
  homepage "https://github.com/museslabs/phonto"
  version "0.3.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/museslabs/phonto/releases/download/v0.3.0/phonto-darwin-aarch64.tar.gz"
      sha256 "08792edc569060bb3d073e23ee9338b92a4159c082419d4d135454832cb784fb"
    end

    on_intel do
      url "https://github.com/museslabs/phonto/releases/download/v0.3.0/phonto-darwin-x86_64.tar.gz"
      sha256 "6d04e29a1372f46304a9a42f00f4a03bd117865bc75dd4ddbd386fea69306047"
    end
  end

  on_linux do
    depends_on "gst-plugins-base"
    depends_on "gstreamer"

    on_intel do
      url "https://github.com/museslabs/phonto/releases/download/v0.3.0/phonto-linux-x86_64.tar.gz"
      sha256 "e92e55df3a41e6ee696e03a3bd8665403eafe31dc13d7c22ce2c6a5d3902c178"
    end
  end

  def install
    bin.install "phonto"
  end

  test do
    assert_match "phonto", shell_output("#{bin}/phonto --help")
  end
end
