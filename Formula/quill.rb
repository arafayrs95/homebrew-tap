# Public Homebrew formula mirrored to arafayrs95/homebrew-tap.
# Users install with:
#
#   brew install arafayrs95/tap/quill
#
# Keep `version` and the four sha256 values synchronized after every release.
class Quill < Formula
  desc "Terminal-native Markdown prompt workspace for Claude and OpenAI"
  homepage "https://quillterminal.app"
  version "0.10.0"
  license :cannot_represent # proprietary — see LICENSE

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.quillterminal.app/releases/v#{version}/quill-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "eae3471c1820f907e0c098f6561f76d7a4ad3b709c9a40627c7e1df1dc4d3074"
    else
      url "https://downloads.quillterminal.app/releases/v#{version}/quill-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "4b2383a1eee84f1d041757bfc2a083035f61d30c11c256c4b3f1e3d73330ed6f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.quillterminal.app/releases/v#{version}/quill-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7474c1debbab424fb1484f374808b3aeb3ff715ec91e5d398cc3565573f6e885"
    else
      url "https://downloads.quillterminal.app/releases/v#{version}/quill-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "990323b311e473619c97990f2463ed04b027e3c30a11090deac63a008979a703"
    end
  end

  def install
    bin.install "quill"
  end

  test do
    assert_match "quill #{version}", shell_output("#{bin}/quill --version")
  end
end
