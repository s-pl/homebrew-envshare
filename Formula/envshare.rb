class Envshare < Formula
  desc "CLI for envShare — self-hosted secrets management for development teams"
  homepage "https://github.com/s-pl/envShare"
  version "2.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/s-pl/envShare/releases/download/v2.0.0/envshare-macos-arm64"
      sha256 "43cb586bf35a8186c8e42e3fe2d3d0caba2bc59a7e378a75f3f67a820813fc27"
    end
    on_intel do
      url "https://github.com/s-pl/envShare/releases/download/v2.0.0/envshare-macos-x64"
      sha256 "ae4f1bc9e161ba95e3d5d4941a0c4e15cc079634fa41b7669fbc7580fbba5dfd"
    end
  end

  on_linux do
    url "https://github.com/s-pl/envShare/releases/download/v2.0.0/envshare-linux-x64"
    sha256 "571db9b1092e9b8095cb58376211252a41d5c21571f02c47a7b8ef2f98f9106e"
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
