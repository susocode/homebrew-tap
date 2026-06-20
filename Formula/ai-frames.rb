class AiFrames < Formula
  desc "Centralized AI context manager for multi-repo workspaces"
  homepage "https://ai-frames.org"
  version "0.1.1"

  depends_on "openssl"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/susocode/ai-frames-cli/releases/download/v0.1.1/ai-frames-macos-arm64.tar.gz"
      sha256 "2824283a4b67b40d42e524a7f0afff7ca1974f9f574ec2d1d072632072a69c68"
    else
      url "https://github.com/susocode/ai-frames-cli/releases/download/v0.1.1/ai-frames-macos-x64.tar.gz"
      sha256 "142a24a5aa7dd84993d6826ffe065baae3a574335b7d370c5cdb41c4c52e78be"
    end
  end

  on_linux do
    url "https://github.com/susocode/ai-frames-cli/releases/download/v0.1.1/ai-frames-linux-x64.tar.gz"
    sha256 "bd8d51d7e0ab18ef272610829000ddad5d1ddd603026eef14de50dd9ccc9b11c"
  end

  def install
    bin.install "ai-frames"
    (share/"ai-frames").install "ui"
    (lib/"ai-frames").install "keytar.node" if File.exist?("keytar.node")
  end

  test do
    system "#{bin}/ai-frames", "--version"
  end
end
