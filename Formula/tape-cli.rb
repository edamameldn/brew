require "language/node"

class TapeCli < Formula
  desc "CLI for mobile devs - share screenshots, recordings as video or GIFs"
  homepage "https://tape.sh/"
  url "https://registry.npmjs.org/tape-cli/-/tape-cli-0.12.2.tgz"
  version "0.12.2"
  sha256 "a4c30e1fb082c0a1801f8f43e1322da5daed4b94298fef2bcc3a1245e499f03e"
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
