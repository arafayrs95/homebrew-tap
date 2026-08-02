# Public Quill Terminal formula mirrored to arafayrs95/homebrew-tap.
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
      url "https://downloads.quillterminal.app/releases/v0.10.2/quill-v0.10.2-aarch64-apple-darwin.tar.gz"
      sha256 "45e4cb97cd9b739591de493de11f6fbc908867819129c69e8a5536455051f7fb"
    else
      url "https://downloads.quillterminal.app/releases/v0.10.2/quill-v0.10.2-x86_64-apple-darwin.tar.gz"
      sha256 "d4612289f795c1f07f087f8340d3e3e97bda6eb9ba121bb060fd664533816473"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.quillterminal.app/releases/v0.10.2/quill-v0.10.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7cf9de60e5bdeff8d6968ed3f6eaebe5930086ea45d18671cf852a80ce9ba5c7"
    else
      url "https://downloads.quillterminal.app/releases/v0.10.2/quill-v0.10.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4250d004fe28cf56407bccb24ba481ecf3d708c113d5fb2d9d5b457c4e02ba88"
    end
  end

  def install
    bin.install "quill"
  end

  test do
    assert_match "quill #{version}", shell_output("#{bin}/quill --version")
  end
end
