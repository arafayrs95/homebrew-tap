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
      url "https://downloads.quillterminal.app/releases/v0.12.11/quill-v0.12.11-aarch64-apple-darwin.tar.gz"
      sha256 "43c28168517c174db1edd72801e25480f3ca8e0f997508fa83fcd65d5aab7227"
    else
      url "https://downloads.quillterminal.app/releases/v0.12.11/quill-v0.12.11-x86_64-apple-darwin.tar.gz"
      sha256 "edafcc809ad4fec7b22672c6ebbf3a4648fed4b9306cf907e22eb2971099c3c6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.quillterminal.app/releases/v0.12.11/quill-v0.12.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "788178505562279be641fcf6794d11e2f813b2cb9468f1c3d9258ac1d737cc11"
    else
      url "https://downloads.quillterminal.app/releases/v0.12.11/quill-v0.12.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "268ef75a7ad2ae43ac8b9c4cd135581c32677ca3dd2c93c93e48d1ef3f5c7c80"
    end
  end

  def install
    bin.install "quill"
  end

  test do
    assert_match "quill #{version}", shell_output("#{bin}/quill --version")
  end
end
