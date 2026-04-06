class Envshare < Formula
  desc "CLI for envShare — self-hosted secrets management for development teams"
  homepage "https://github.com/s-pl/envShare"
  version "2.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/s-pl/envShare/releases/download/v2.0.0/envshare-macos-arm64"
      sha256 "f052c4ecc06172aa96ed4660dc38478eb1646ba432021fe9943fea3c77909034"
    end
    on_intel do
      url "https://github.com/s-pl/envShare/releases/download/v2.0.0/envshare-macos-x64"
      sha256 "2d7dcb13571a84a2109522bb5dca45e63ef15d1eace3a1e3d20076caaf858b2b"
    end
  end

  on_linux do
    url "https://github.com/s-pl/envShare/releases/download/v2.0.0/envshare-linux-x64"
    sha256 "f4446d08ce0793a1f6b17fe34282de2e6d9046368548e7d3eeeb58f1ca68c3a7"
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
