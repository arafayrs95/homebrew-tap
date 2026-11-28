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
      url "https://downloads.quillterminal.app/releases/v1.0.0/quill-v1.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "0dc9342312fff99a81a250b2104a52955cb26a8f6074712f68b872a21cea3f9e"
    else
      url "https://downloads.quillterminal.app/releases/v1.0.0/quill-v1.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "dac8cac0c7e7de07c3ceb3953bb97d061529269c30800d53dd111272265a469c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.quillterminal.app/releases/v1.0.0/quill-v1.0.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c682e10fa9c84224107fd0770bc70505f6d0e8110eaeeda95de9e60c037e7445"
    else
      url "https://downloads.quillterminal.app/releases/v1.0.0/quill-v1.0.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8864e90f29c01c7dcace509d33498556f2abb3e1cb92dbe878c4fade9d6023c2"
    end
  end

  def install
    bin.install "quill"
  end

  test do
    assert_match "quill #{version}", shell_output("#{bin}/quill --version")
  end
end
