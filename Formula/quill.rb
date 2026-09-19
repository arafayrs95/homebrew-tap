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
      url "https://downloads.quillterminal.app/releases/v0.12.8/quill-v0.12.8-aarch64-apple-darwin.tar.gz"
      sha256 "64c0777767582626ab56904fcee0f8327d7e25d8ee14fec81685b8cb3a4fa7cd"
    else
      url "https://downloads.quillterminal.app/releases/v0.12.8/quill-v0.12.8-x86_64-apple-darwin.tar.gz"
      sha256 "d5bc4d1ffa3a1807b62d1c7c1ec8a6cb166a1676cbdfaba5b05f634d124964ee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.quillterminal.app/releases/v0.12.8/quill-v0.12.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cb7e28ca2a98d353bd2a8e5351dd73e765bf72a31e6124c659b35aff1a9cdf9a"
    else
      url "https://downloads.quillterminal.app/releases/v0.12.8/quill-v0.12.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fc24054f02c85e775d771e41382a9e230afbc9f3650cb9b823bf176295029a90"
    end
  end

  def install
    bin.install "quill"
  end

  test do
    assert_match "quill #{version}", shell_output("#{bin}/quill --version")
  end
end
