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
      url "https://downloads.quillterminal.app/releases/v0.12.7/quill-v0.12.7-aarch64-apple-darwin.tar.gz"
      sha256 "1b2d9ea84eff6a6bfc9437b4f1d4941fa640432bed1c9e143716fa1f47e4dc18"
    else
      url "https://downloads.quillterminal.app/releases/v0.12.7/quill-v0.12.7-x86_64-apple-darwin.tar.gz"
      sha256 "2c4c3299cf0634c4fa233634fa3e114645410e565871e5dc390cdab25da45d75"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.quillterminal.app/releases/v0.12.7/quill-v0.12.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2eec0f0778f8e1e4f8195c7cc2c0344e2039a161a5885d7fda724e57c3edfab2"
    else
      url "https://downloads.quillterminal.app/releases/v0.12.7/quill-v0.12.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e6865cdbf624f734191b32f1eb417d134a852ba41b9ddba54eb5efb13300d0e3"
    end
  end

  def install
    bin.install "quill"
  end

  test do
    assert_match "quill #{version}", shell_output("#{bin}/quill --version")
  end
end
