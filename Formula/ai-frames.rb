class AiFrames < Formula
  desc "Centralized AI context manager for multi-repo workspaces"
  homepage "https://ai-frames.org"
  url "https://registry.npmjs.org/ai-frames/-/ai-frames-0.3.0.tgz"
  sha256 "7e97482d53c5ecd6724edcc5a4b00590f89421c82c568aea7681713ffd953c3d"
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
