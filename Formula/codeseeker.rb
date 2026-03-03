class Codeseeker < Formula
  desc "Graph-powered code intelligence for Claude Code"
  homepage "https://github.com/jghiringhelli/codeseeker"
  url "https://registry.npmjs.org/codeseeker/-/codeseeker-1.11.1.tgz"
  sha256 "c4629703fa39c9042f27b968bb59a9f842850d24904716ca59f98bae50503740"
  license "MIT"
  depends_on "node@22"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["\#{libexec}/bin/*"]
  end

  test do
    system "\#{bin}/codeseeker", "--version"
  end
end
