require "language/node"

class TapeCli < Formula
  desc "CLI for mobile devs - share screenshots, recordings as video or GIFs"
  homepage "https://tape.sh/"
  url "https://registry.npmjs.org/tape-cli/-/tape-cli-0.12.1.tgz"
  sha256 "be24f298fb7b5e719e368aae7ecd0c6757bf12f99707f6e1cbd34fe68c6c12a9"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
    ohai "🎉 Please run `tape config --setup` to get started \n"
  end

  test do
    output = shell_output("#{bin}/tape config --check")
    assert_match "Run tape config", output.squeeze # large output
  end
end
