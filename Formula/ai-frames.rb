class AiFrames < Formula
  desc "Centralized AI context manager for multi-repo workspaces"
  homepage "https://ai-frames.org"
  version "0.1.0"

  depends_on "openssl"

  BASE = "https://github.com/susocode/ai-frames-cli/releases/download/v#{version}"

  on_macos do
    if Hardware::CPU.arm?
      url "#{BASE}/ai-frames-macos-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      url "#{BASE}/ai-frames-macos-x64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    url "#{BASE}/ai-frames-linux-x64.tar.gz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end

  def install
    if OS.mac?
      bin.install "ai-frames-macos-arm64" => "ai-frames" if Hardware::CPU.arm?
      bin.install "ai-frames-macos-x64"   => "ai-frames" unless Hardware::CPU.arm?
    elsif OS.linux?
      bin.install "ai-frames-linux-x64" => "ai-frames"
    end
  end

  test do
    system "#{bin}/ai-frames", "--version"
  end
end
