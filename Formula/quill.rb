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
      url "https://downloads.quillterminal.app/releases/v0.12.10/quill-v0.12.10-aarch64-apple-darwin.tar.gz"
      sha256 "e03c1a3f2daf47cf1e952cdf2d4c07f8fb2fac37c1b19642177259c89b64d0b3"
    else
      url "https://downloads.quillterminal.app/releases/v0.12.10/quill-v0.12.10-x86_64-apple-darwin.tar.gz"
      sha256 "a2bb0f2a94206344b79e3e4fb927987ac6a0ee0ef06c8886ca68bd15159f45f2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.quillterminal.app/releases/v0.12.10/quill-v0.12.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3188bd7f9179cbf066ba6e18db3ef68ed03ec23454ffa787e30c22ed56a1879f"
    else
      url "https://downloads.quillterminal.app/releases/v0.12.10/quill-v0.12.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "699e38a0fa16736f6a615c50a989442620d194f315a61abbef915bfa733843b7"
    end
  end

  def install
    bin.install "quill"
  end

  test do
    assert_match "quill #{version}", shell_output("#{bin}/quill --version")
  end
end
