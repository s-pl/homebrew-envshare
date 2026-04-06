class Envshare < Formula
  desc "CLI for envShare — self-hosted secrets management for development teams"
  homepage "https://github.com/s-pl/envShare"
  version "2.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/s-pl/envShare/releases/download/v2.0.1/envshare-macos-arm64"
      sha256 "7324ffe5a6ecde8a8450a32ba3dd123b51c60f1e9c4e4dd676235789f3450c3b"
    end
    on_intel do
      url "https://github.com/s-pl/envShare/releases/download/v2.0.1/envshare-macos-x64"
      sha256 "bb8c9bd912f9d7d044273a845250ec81af246dbb97a5064c58861206a010c94e"
    end
  end

  on_linux do
    url "https://github.com/s-pl/envShare/releases/download/v2.0.1/envshare-linux-x64"
    sha256 "b08134596f507a79c6f3151e9ee8bb8611b296105bea2f4e84bfeb601e8184e5"
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
