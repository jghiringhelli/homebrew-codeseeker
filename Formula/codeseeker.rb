class Codeseeker < Formula
  desc "Graph-powered code intelligence for Claude Code"
  homepage "https://github.com/jghiringhelli/codeseeker"
  url "https://registry.npmjs.org/codeseeker/-/codeseeker-1.8.0.tgz"
  sha256 "496cab50deb38f8243cfec7bc3e393a45bf981e02da0dd9b83542ec5be2a7e01"
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
