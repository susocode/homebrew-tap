class AiFrames < Formula
  desc "Centralized AI context manager for multi-repo workspaces"
  homepage "https://ai-frames.org"
  version "0.1.0"

  depends_on "openssl"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/susocode/ai-frames-cli/releases/download/v0.1.0/ai-frames-macos-arm64.tar.gz"
      sha256 "b93b5b9fbacb9f006c85f023cbc39fd2dad8dcc5b5a0cb8742a259c123c28e5c"
    else
      url "https://github.com/susocode/ai-frames-cli/releases/download/v0.1.0/ai-frames-macos-x64.tar.gz"
      sha256 "21e7f9914a3fc5b74adddd0beb2f92552d04a7fc3000086d4f95cf3f4c38d28e"
    end
  end

  on_linux do
    url "https://github.com/susocode/ai-frames-cli/releases/download/v0.1.0/ai-frames-linux-x64.tar.gz"
    sha256 "089ac8e1586bbdaa52c9554e64f912fca701f1597e4f1a7430d043a086f74288"
  end

  def install
    bin.install "ai-frames"
    (lib/"ai-frames").install "keytar.node" if File.exist?("keytar.node")
  end

  test do
    system "#{bin}/ai-frames", "--version"
  end
end
