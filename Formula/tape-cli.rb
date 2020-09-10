require "language/node"

class TapeCli < Formula
  desc "CLI for mobile devs - share screenshots, recordings as video or GIFs"
  homepage "https://tape.sh/"
  url "https://registry.npmjs.org/tape-cli/-/tape-cli-0.13.3.tgz"
  version "0.13.3"
  sha256 "aa668e229e82cba3ba4d591fcf02b41533c1600aff98d72e8f7cef17d89d2ec7"
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
