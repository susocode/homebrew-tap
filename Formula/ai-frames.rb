class AiFrames < Formula
  desc "Centralized AI context manager for multi-repo workspaces"
  homepage "https://ai-frames.org"
  url "https://registry.npmjs.org/ai-frames/-/ai-frames-0.5.0.tgz"
  sha256 "666300ab05cd21bf5a74b5cb4c2faf8b0ae6b36f33738bcd29b80b4e2d6fc4f5"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args(prefix: libexec)
    bin.install_symlink libexec/"bin/ai-frames"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ai-frames --version")
  end
end
