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
      url "https://downloads.quillterminal.app/releases/v0.12.9/quill-v0.12.9-aarch64-apple-darwin.tar.gz"
      sha256 "b3f466caca2dc8cd006b53e65cdfb597e6fc487aeb0652a44d1cf5a052ae1b98"
    else
      url "https://downloads.quillterminal.app/releases/v0.12.9/quill-v0.12.9-x86_64-apple-darwin.tar.gz"
      sha256 "8639981eb9d17df475566457a8aded98db928a70397795fc1373755bf7b89428"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.quillterminal.app/releases/v0.12.9/quill-v0.12.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c925c6442096ada8a3b1df925e7a0f083d231748fdfc606cd7c563b4056ee0bf"
    else
      url "https://downloads.quillterminal.app/releases/v0.12.9/quill-v0.12.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "19cce089d31cfd4e40315ae0016b93c16ef3b6129b032cff7fe4896223841d31"
    end
  end

  def install
    bin.install "quill"
  end

  test do
    assert_match "quill #{version}", shell_output("#{bin}/quill --version")
  end
end
