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
      url "https://downloads.quillterminal.app/releases/v0.12.5/quill-v0.12.5-aarch64-apple-darwin.tar.gz"
      sha256 "fec7b2b24473df707c857c3d65e7bd498e241ffea9dcf3012d5054c07060ad79"
    else
      url "https://downloads.quillterminal.app/releases/v0.12.5/quill-v0.12.5-x86_64-apple-darwin.tar.gz"
      sha256 "1c7833fddda4f372831a72dc5493a1a4171ecfc4da4f95b690dfbbd7a79a8f04"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.quillterminal.app/releases/v0.12.5/quill-v0.12.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "005aef924888c19a39929f95a524c551776b9158153530f31e3999820c9a3b99"
    else
      url "https://downloads.quillterminal.app/releases/v0.12.5/quill-v0.12.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f61e86db58752ddb549c55170f7f7bdd79dbcf9e2113ae03f5e13ac01ce91b36"
    end
  end

  def install
    bin.install "quill"
  end

  test do
    assert_match "quill #{version}", shell_output("#{bin}/quill --version")
  end
end
