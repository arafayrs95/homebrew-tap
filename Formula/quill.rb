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
      url "https://downloads.quillterminal.app/releases/v0.10.1/quill-v0.10.1-aarch64-apple-darwin.tar.gz"
      sha256 "6ce19525d445d0ffd27d96e21546065a8bdd1118f53f0bde45224beedc68c03d"
    else
      url "https://downloads.quillterminal.app/releases/v0.10.1/quill-v0.10.1-x86_64-apple-darwin.tar.gz"
      sha256 "10b7dfc4a976e5394c225352728ccac3792607f21752118aa514c072b65dd8c9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.quillterminal.app/releases/v0.10.1/quill-v0.10.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "017b16f6f3e7280be69849663a476f711decb824c4cd1efb9033f3367051bf2e"
    else
      url "https://downloads.quillterminal.app/releases/v0.10.1/quill-v0.10.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6a0ee5d19595d65de48eee580c3e06829f6cda62bb1394dbdae316ab522ebe0f"
    end
  end

  def install
    bin.install "quill"
  end

  test do
    assert_match "quill #{version}", shell_output("#{bin}/quill --version")
  end
end
