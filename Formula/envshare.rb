class Envshare < Formula
  desc "CLI for envShare — self-hosted secrets management for development teams"
  homepage "https://github.com/s-pl/envShare"
  version "2.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/s-pl/envShare/releases/download/v2.0.0/envshare-macos-arm64"
      sha256 "02d7ff14eba17e0e95111b8a0776d4941138efb7c7f2e79a367180ea5405fa50"
    end
    on_intel do
      url "https://github.com/s-pl/envShare/releases/download/v2.0.0/envshare-macos-x64"
      sha256 "b8adb5a8d215b60d1accc8aa2a8a56fa4e4ca048e2d89edb0ef5e614d7794dd9"
    end
  end

  on_linux do
    url "https://github.com/s-pl/envShare/releases/download/v2.0.0/envshare-linux-x64"
    sha256 "9bfcf88f039007a6a12bde9e39abcd2392aa613a20f97cc0824e427bf2f7ee01"
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
