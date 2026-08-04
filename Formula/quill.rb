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
      url "https://downloads.quillterminal.app/releases/v0.10.3/quill-v0.10.3-aarch64-apple-darwin.tar.gz"
      sha256 "02de610e3ae6bb5a8773332c2aeabc2e60ad3fcf07e6171d64eb9679396d33d7"
    else
      url "https://downloads.quillterminal.app/releases/v0.10.3/quill-v0.10.3-x86_64-apple-darwin.tar.gz"
      sha256 "73d82786fe53a159791f2dba9e5b3c07bf2470434759e4c3ea07bcbeb5d16f44"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.quillterminal.app/releases/v0.10.3/quill-v0.10.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "76c67177a57e00a60272faedf4b78ddcd1c804ca245aed920c2e6a0e37859c43"
    else
      url "https://downloads.quillterminal.app/releases/v0.10.3/quill-v0.10.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2e914a8ac7358999c654a5558964162e90a830d2537bb3d0d64579b2c9f7e237"
    end
  end

  def install
    bin.install "quill"
  end

  test do
    assert_match "quill #{version}", shell_output("#{bin}/quill --version")
  end
end
