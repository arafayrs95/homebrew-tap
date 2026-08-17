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
      url "https://downloads.quillterminal.app/releases/v0.12.0/quill-v0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "fd27d43fe1bcb7497ccd2f4a30deeed8afd630fb63b3f85aaa727b797b3850ad"
    else
      url "https://downloads.quillterminal.app/releases/v0.12.0/quill-v0.12.0-x86_64-apple-darwin.tar.gz"
      sha256 "83fc47e7cea17c92ae872a095d579e5b6d9695e721a84c4e581684de592ad8ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.quillterminal.app/releases/v0.12.0/quill-v0.12.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bb3f142582360c21b14ccbf9446afa8e472c1e9a918023e847c0afed86a2e863"
    else
      url "https://downloads.quillterminal.app/releases/v0.12.0/quill-v0.12.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f3c2669089e13ee40d03f69c0d4667cbec6442028c369c0f7e23e03236861840"
    end
  end

  def install
    bin.install "quill"
  end

  test do
    assert_match "quill #{version}", shell_output("#{bin}/quill --version")
  end
end
