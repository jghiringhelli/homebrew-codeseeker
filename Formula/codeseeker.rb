class Codeseeker < Formula
  desc "Graph-powered code intelligence for Claude Code and AI assistants"
  homepage "https://github.com/jghiringhelli/codeseeker"
  url "https://registry.npmjs.org/codeseeker/-/codeseeker-1.7.1.tgz"
  sha256 "6b313544cb01109e6115de2fecddd7f311eb69f4b4bf93b56459ec0849e8f529"
  license "MIT"

  depends_on "node@18"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/codeseeker", "--version"
  end

  def caveats
    <<~EOS
      CodeSeeker is now installed!

      Quick start:
        1. cd your-project
        2. codeseeker install --vscode    # or --cursor, --windsurf
        3. Restart your IDE

      Verify installation:
        Ask your AI assistant: "What CodeSeeker tools do you have?"

      Documentation: https://github.com/jghiringhelli/codeseeker#readme
    EOS
  end
end
