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
      url "https://downloads.quillterminal.app/releases/v0.12.3/quill-v0.12.3-aarch64-apple-darwin.tar.gz"
      sha256 "a6324e5c682e4f362a7ad8adac1b33444b1c76b42701d5a0080f6f84fc1fb558"
    else
      url "https://downloads.quillterminal.app/releases/v0.12.3/quill-v0.12.3-x86_64-apple-darwin.tar.gz"
      sha256 "cb85efa4e9e843e995f583e24bdcb7dc96c0e0944d88010291684001c0d37447"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.quillterminal.app/releases/v0.12.3/quill-v0.12.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "414fbe15f2fc430a73771b68cd1e5836372b71bab278098589a6ee43ee6f5099"
    else
      url "https://downloads.quillterminal.app/releases/v0.12.3/quill-v0.12.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ce3dc0f0f1bcd2d6831d33d95dd2ef1c06f08c25a82a40e4eaf961943faf869f"
    end
  end

  def install
    bin.install "quill"
  end

  test do
    assert_match "quill #{version}", shell_output("#{bin}/quill --version")
  end
end
