class Envshare < Formula
  desc "CLI for envShare — self-hosted secrets management for development teams"
  homepage "https://github.com/s-pl/envShare"
  version "2.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/s-pl/envShare/releases/download/v2.0.1/envshare-macos-arm64"
      sha256 "4930193f04d82527ac3cb1a3b05b66f8f25590de9accf25ab6ab03c7b969d99f"
    end
    on_intel do
      url "https://github.com/s-pl/envShare/releases/download/v2.0.1/envshare-macos-x64"
      sha256 "d90be5186eed80c7ccc155321021040d87c4c195667e34594b83622b7fe6fcd6"
    end
  end

  on_linux do
    url "https://github.com/s-pl/envShare/releases/download/v2.0.1/envshare-linux-x64"
    sha256 "203a072915a2fcc6d48c75d3ac6d9d1df5fd0bf44227fde2e41bc39db8d7c8c0"
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
