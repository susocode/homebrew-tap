class AiFrames < Formula
  desc "Centralized AI context manager for multi-repo workspaces"
  homepage "https://ai-frames.org"
  url "https://registry.npmjs.org/ai-frames/-/ai-frames-0.4.0.tgz"
  sha256 "3cc2a65b7e78dd8fcbd21f4dd3442844b005505f94d2c880e7aeb4edcde22dbf"
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
