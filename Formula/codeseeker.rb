class Codeseeker < Formula
  desc "Graph-powered code intelligence for Claude Code"
  homepage "https://github.com/jghiringhelli/codeseeker"
  url "https://registry.npmjs.org/codeseeker/-/codeseeker-1.8.2.tgz"
  sha256 "ba6344e86d2fac5e8e573786beb82b10b93b2e21876a4726c6e30ba0759b81b2"
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
