class Codeseeker < Formula
  desc "Graph-powered code intelligence for Claude Code"
  homepage "https://github.com/jghiringhelli/codeseeker"
  url "https://registry.npmjs.org/codeseeker/-/codeseeker-1.8.1.tgz"
  sha256 "38a77156b2b6a4bc31906b6a128bb17996aa07cbdccae35ae5005bb26c075780"
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
