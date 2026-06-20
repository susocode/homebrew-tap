class AiFrames < Formula
  desc "Centralized AI context manager for multi-repo workspaces"
  homepage "https://ai-frames.org"
  url "https://registry.npmjs.org/ai-frames/-/ai-frames-0.5.2.tgz"
  sha256 "b5c9eb746265c0afe6e5ae2f6c70e516f7ed0db9dc20c70c547da1214da89ab6"
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
