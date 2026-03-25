class Envshare < Formula
  desc "CLI for envShare — self-hosted secrets management for development teams"
  homepage "https://github.com/s-pl/envShare"
  version "1.0.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/s-pl/envShare/releases/download/v1.0.7/envshare-macos-arm64"
      sha256 "1ab0d6dc1c50605693a4b7ee1b7b89ce7e942a2077f1012a952ebfb187f3387c"
    end
    on_intel do
      url "https://github.com/s-pl/envShare/releases/download/v1.0.7/envshare-macos-x64"
      sha256 "f1e231af8a2a24b7a7d6dd7831f42900ead098f79375d046614e8b6ead06a19a"
    end
  end

  on_linux do
    url "https://github.com/s-pl/envShare/releases/download/v1.0.7/envshare-linux-x64"
    sha256 "8d616782e37ef6bd5d22003743d5da5b1960f5d47c7f584dedaa411e79b99602"
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
