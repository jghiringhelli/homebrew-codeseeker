class Codeseeker < Formula
  desc "Graph-powered code intelligence for Claude Code"
  homepage "https://github.com/jghiringhelli/codeseeker"
  url "https://registry.npmjs.org/codeseeker/-/codeseeker-refs/heads/master.tgz"
  sha256 "67abc7a1805ce1c843eecfa4105a652a3d9df0e2ece4e1f64b9ea39ded77d2ff"
  license "MIT"
  depends_on "node@18"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["\#{libexec}/bin/*"]
  end

  test do
    system "\#{bin}/codeseeker", "--version"
  end
end
