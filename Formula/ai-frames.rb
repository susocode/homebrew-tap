class AiFrames < Formula
  desc "Centralized AI context manager for multi-repo workspaces"
  homepage "https://ai-frames.org"
  url "https://registry.npmjs.org/ai-frames/-/ai-frames-0.5.1.tgz"
  sha256 "a5397046af73d50a1775f70e2245ff3b9a32147e2f4f20ebdf7dae74bb8fea4b"
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
