class Envshare < Formula
  desc "CLI for envShare — self-hosted secrets management for development teams"
  homepage "https://github.com/s-pl/envShare"
  version "1.0.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/s-pl/envShare/releases/download/v1.0.7/envshare-macos-arm64"
      sha256 "055133792b00d3f3b9b4f0336abd18cd73b86084beb692080ee1f2a4dcf2779c"
    end
    on_intel do
      url "https://github.com/s-pl/envShare/releases/download/v1.0.7/envshare-macos-x64"
      sha256 "17c21ad174083ec6bed002acd170f0bef2cbba674d34c70f34fe21c4ae322b5e"
    end
  end

  on_linux do
    url "https://github.com/s-pl/envShare/releases/download/v1.0.7/envshare-linux-x64"
    sha256 "05142cae8660ac039c895da9b3e05e1867364479e111218829e55a842ad28487"
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
