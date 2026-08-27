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
      url "https://downloads.quillterminal.app/releases/v0.12.4/quill-v0.12.4-aarch64-apple-darwin.tar.gz"
      sha256 "6ace3b5c0241db7c85d752a0a78a7f058d3400b48a7d2cd9539d163cedc7260f"
    else
      url "https://downloads.quillterminal.app/releases/v0.12.4/quill-v0.12.4-x86_64-apple-darwin.tar.gz"
      sha256 "5d49c6c9a2660bfca3b784786f2634b72ce01957a2a8361151e697699c54a0a1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.quillterminal.app/releases/v0.12.4/quill-v0.12.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6dd77547c17e4a06778939702ac7e36692600a17174bb75ca988e690e426c577"
    else
      url "https://downloads.quillterminal.app/releases/v0.12.4/quill-v0.12.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "de146884062771df0455d67d21f9b21c9b619d14a4959e1d68f70f3eeb857066"
    end
  end

  def install
    bin.install "quill"
  end

  test do
    assert_match "quill #{version}", shell_output("#{bin}/quill --version")
  end
end
