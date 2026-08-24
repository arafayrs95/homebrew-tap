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
      url "https://downloads.quillterminal.app/releases/v0.12.1/quill-v0.12.1-aarch64-apple-darwin.tar.gz"
      sha256 "6afa522c94593f544b461e582ba6cc94f54a08921797326c51494a3ad83b785a"
    else
      url "https://downloads.quillterminal.app/releases/v0.12.1/quill-v0.12.1-x86_64-apple-darwin.tar.gz"
      sha256 "2ab6108f897c7f39de6ac43279f5dccafa934c09be5612043e0997cb7daa8b21"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.quillterminal.app/releases/v0.12.1/quill-v0.12.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "efa5203366d1f121c9a48d4c26a9f61465cb94fa0d92244734e5846902aeb323"
    else
      url "https://downloads.quillterminal.app/releases/v0.12.1/quill-v0.12.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3aaac51a1783dbdb611f62cacada2c4b88d3c0c8b3cd4347e74fa2e024fa21dd"
    end
  end

  def install
    bin.install "quill"
  end

  test do
    assert_match "quill #{version}", shell_output("#{bin}/quill --version")
  end
end
