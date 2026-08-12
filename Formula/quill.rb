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
      url "https://downloads.quillterminal.app/releases/v0.11.4/quill-v0.11.4-aarch64-apple-darwin.tar.gz"
      sha256 "c8ae8ab1b8dbd2dd83fb9bd75df72b489b872d67f4cd6321bff8bb90b63449bb"
    else
      url "https://downloads.quillterminal.app/releases/v0.11.4/quill-v0.11.4-x86_64-apple-darwin.tar.gz"
      sha256 "355d5b33020226889750ef4414694a79e5d2b7e275474b62ba3dc032b28c9d24"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.quillterminal.app/releases/v0.11.4/quill-v0.11.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7f692958041f9758b088789a6268a56507fc83d2e81f837a2e43211ac3c05339"
    else
      url "https://downloads.quillterminal.app/releases/v0.11.4/quill-v0.11.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f32a216d4d6f44a4d24df2f7028bf23a58a7609b760e3ef821d6aa77335b426d"
    end
  end

  def install
    bin.install "quill"
  end

  test do
    assert_match "quill #{version}", shell_output("#{bin}/quill --version")
  end
end
