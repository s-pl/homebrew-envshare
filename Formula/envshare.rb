class Envshare < Formula
  desc "CLI for envShare — self-hosted secrets management for development teams"
  homepage "https://github.com/s-pl/envShare"
  version "2.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/s-pl/envShare/releases/download/v2.0.1/envshare-macos-arm64"
      sha256 "30894b95d7ffe7c98eb62751f4c2aa6b999ff835c80d35c927b4dcccbcaabb00"
    end
    on_intel do
      url "https://github.com/s-pl/envShare/releases/download/v2.0.1/envshare-macos-x64"
      sha256 "5a83515a89e7389a85a9eb79473face53c9b4af3f08a633ee2645a080d761064"
    end
  end

  on_linux do
    url "https://github.com/s-pl/envShare/releases/download/v2.0.1/envshare-linux-x64"
    sha256 "073cd8b353bbdbf184f8f252494c971381f5da1a17dc4b6e8882ec981dd37e95"
  end

  def install
    if OS.mac?
      bin.install (Hardware::CPU.arm? ? "envshare-macos-arm64" : "envshare-macos-x64") => "envshare"
    else
      bin.install "envshare-linux-x64" => "envshare"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/envshare version 2>&1")
  end
end
