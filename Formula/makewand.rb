class Makewand < Formula
  desc "AI coding assistant CLI"
  homepage "https://github.com/makewand/makewand"
  version "0.1.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/makewand/makewand/releases/download/v0.1.9/makewand_v0.1.9_darwin_arm64.tar.gz"
      sha256 "81e8fc0c398f6bf88506cd633d6fd9706387c6acdb364f413b5f4bd901454ca9"
    else
      url "https://github.com/makewand/makewand/releases/download/v0.1.9/makewand_v0.1.9_darwin_amd64.tar.gz"
      sha256 "e28108a4789e70caadcc5ff54438c797c67e6bb06676ec8671026e633cc87b1c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/makewand/makewand/releases/download/v0.1.9/makewand_v0.1.9_linux_arm64.tar.gz"
      sha256 "3cefcb34db5b99d7b6aa6b9b4096b09fab33f4af560ca4f3b3db7262664f6ff0"
    else
      url "https://github.com/makewand/makewand/releases/download/v0.1.9/makewand_v0.1.9_linux_amd64.tar.gz"
      sha256 "a2afeb9afccf517da78d4752b5dd7c75e7b276735abcae329271847d448dab1f"
    end
  end

  def install
    bin.install Dir["*/makewand"].first
  end

  test do
    assert_match "makewand version", shell_output("#{bin}/makewand --version")
  end
end
