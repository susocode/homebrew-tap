class AiFrames < Formula
  desc "Centralized AI context manager for multi-repo workspaces"
  homepage "https://ai-frames.org"
  version "0.1.2"

  depends_on "openssl"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/susocode/ai-frames-cli/releases/download/v0.1.2/ai-frames-macos-arm64.tar.gz"
      sha256 "3b1490b397cd08402b4fab1a38e394809e3f6fe3d7165c35aaa4c52448345d06"
    else
      url "https://github.com/susocode/ai-frames-cli/releases/download/v0.1.2/ai-frames-macos-x64.tar.gz"
      sha256 "e0081407e23e0eaea343c1910d0f8bb8a3f6a2dd04ff271d98a045076deb642f"
    end
  end

  on_linux do
    url "https://github.com/susocode/ai-frames-cli/releases/download/v0.1.2/ai-frames-linux-x64.tar.gz"
    sha256 "cf958d22d8a1be5b6b679903042f8b1da57d224f73cf5eb023f315b133be7cd6"
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
