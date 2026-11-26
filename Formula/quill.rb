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
      url "https://downloads.quillterminal.app/releases/v0.12.12/quill-v0.12.12-aarch64-apple-darwin.tar.gz"
      sha256 "9415a253b59167d59cb22b32ea2e9e99e72355657477defc90f983bca6952a0a"
    else
      url "https://downloads.quillterminal.app/releases/v0.12.12/quill-v0.12.12-x86_64-apple-darwin.tar.gz"
      sha256 "9047601ca0a1a7d82bc6bc5610fdb6b201a4c7e6e25ac8003ed754a58914e58a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.quillterminal.app/releases/v0.12.12/quill-v0.12.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a4f0ef70b9958cfc6d339ef6ac8c5ae503bdab84d6aced3e87cde3f9db9a913e"
    else
      url "https://downloads.quillterminal.app/releases/v0.12.12/quill-v0.12.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "44f133a10ac91e244ba4b60648cb61690cef57b32151b501c07409f3f99450fe"
    end
  end

  def install
    bin.install "quill"
  end

  test do
    assert_match "quill #{version}", shell_output("#{bin}/quill --version")
  end
end
