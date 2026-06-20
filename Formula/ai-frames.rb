class AiFrames < Formula
  desc "Centralized AI context manager for multi-repo workspaces"
  homepage "https://ai-frames.org"
  version "0.1.0"

  depends_on "openssl"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/susocode/ai-frames-cli/releases/download/v0.1.0/ai-frames-macos-arm64.tar.gz"
      sha256 "bb3ba39c9049ff81565846fd0abeb1432269d3958649d6123460f968fb481d7b"
    else
      url "https://github.com/susocode/ai-frames-cli/releases/download/v0.1.0/ai-frames-macos-x64.tar.gz"
      sha256 "fa5667aea1d79992fd69f4072a85d0508cc0c2e62fb2263a949f29f674d03776"
    end
  end

  on_linux do
    url "https://github.com/susocode/ai-frames-cli/releases/download/v0.1.0/ai-frames-linux-x64.tar.gz"
    sha256 "f84bbffa5a990689f3d4f50a8af94ce13144fc7c853e7931b586167776abe8fb"
  end

  def install
    bin.install "ai-frames"
    (lib/"ai-frames").install "keytar.node" if File.exist?("keytar.node")
  end

  test do
    system "#{bin}/ai-frames", "--version"
  end
end
