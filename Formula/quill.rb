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
      url "https://downloads.quillterminal.app/releases/v0.12.6/quill-v0.12.6-aarch64-apple-darwin.tar.gz"
      sha256 "2004209d6f18619bf8de599f381f2d7148f9324029ca7a4bdd4d4bd19827b0f5"
    else
      url "https://downloads.quillterminal.app/releases/v0.12.6/quill-v0.12.6-x86_64-apple-darwin.tar.gz"
      sha256 "404c7bc61bcbd07f4d0632cbead8c88a2067cbc4e22c67ef77bc9673bbb19585"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.quillterminal.app/releases/v0.12.6/quill-v0.12.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0e7ee34ea73890956f00866a7544896c1f548429b719b189d45b794602622696"
    else
      url "https://downloads.quillterminal.app/releases/v0.12.6/quill-v0.12.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6595e278feb477ce17aedac5fcaedf8aa38484f860c4d8f9dedfabc957d0b19e"
    end
  end

  def install
    bin.install "quill"
  end

  test do
    assert_match "quill #{version}", shell_output("#{bin}/quill --version")
  end
end
