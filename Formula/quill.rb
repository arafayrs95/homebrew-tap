# Public Homebrew formula mirrored to arafayrs95/homebrew-tap.
# Users install with:
#
#   brew install arafayrs95/tap/quill
#
# Keep the four versioned URLs and sha256 values synchronized after every release.
class Quill < Formula
  desc "Terminal-native Markdown prompt workspace for Claude and OpenAI"
  homepage "https://quillterminal.app"
  license :cannot_represent # proprietary — see LICENSE

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.quillterminal.app/releases/v0.10.4/quill-v0.10.4-aarch64-apple-darwin.tar.gz"
      sha256 "9bff2eb17397539d3600c42ba90657d0d5dd8280d9f75babe2244d88acc4d7b7"
    else
      url "https://downloads.quillterminal.app/releases/v0.10.4/quill-v0.10.4-x86_64-apple-darwin.tar.gz"
      sha256 "b4616cbb89be1804434bae8deea10acfa5487f97ccd07c90ae7c84bf03b99419"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.quillterminal.app/releases/v0.10.4/quill-v0.10.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "24f2c4cfe8487a41c043e95ecde921d5718cc54f5ab8b5fbf9118d010220859c"
    else
      url "https://downloads.quillterminal.app/releases/v0.10.4/quill-v0.10.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3dd1e068044a4aa326241cc5e6ca45fbb8f9bc68530e9f692698200b891e195d"
    end
  end

  def install
    bin.install "quill"
  end

  test do
    assert_match "quill #{version}", shell_output("#{bin}/quill --version")
  end
end
