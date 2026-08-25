# typed: strict
# frozen_string_literal: true

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
      url "https://downloads.quillterminal.app/releases/v0.12.2/quill-v0.12.2-aarch64-apple-darwin.tar.gz"
      sha256 "7917f56001ad03f43ee5b86cd49784fc1ad17e7da51bec5d44fdd812d7d91eac"
    else
      url "https://downloads.quillterminal.app/releases/v0.12.2/quill-v0.12.2-x86_64-apple-darwin.tar.gz"
      sha256 "fe9e6645160c4a1a11e48b656059707e7cf2ef8fd69d3206402d986b48272cdc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.quillterminal.app/releases/v0.12.2/quill-v0.12.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "94266e7f1faca52499ac659d47fd5b443e058c2ef2e89ec4b96d5739a285002c"
    else
      url "https://downloads.quillterminal.app/releases/v0.12.2/quill-v0.12.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6606cb9bd58f3f002f2eaad8f2b57a5734f693a1b4370e02567f60235cf8804c"
    end
  end

  def install
    bin.install "quill"
  end

  test do
    assert_match "quill #{version}", shell_output("#{bin}/quill --version")
  end
end
