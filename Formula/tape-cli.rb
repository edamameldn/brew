require "language/node"

class TapeCli < Formula
  desc "CLI for mobile devs - share screenshots, recordings as video or GIFs"
  homepage "https://tape.sh/"
  url "https://registry.npmjs.org/tape-cli/-/tape-cli-0.13.1.tgz"
  version "0.13.1"
  sha256 "dcdd452fb5c78f8882b406a75873a8e99b096beedf2d1710fad8309b69dbeecd"
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
