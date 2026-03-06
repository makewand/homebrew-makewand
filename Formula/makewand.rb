class Makewand < Formula
  desc "AI coding assistant CLI"
  homepage "https://github.com/makewand/makewand"
  version "0.1.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/makewand/makewand/releases/download/v0.1.10/makewand_v0.1.10_darwin_arm64.tar.gz"
      sha256 "e31ce8025852e75fe31de22780c01c9a2ce520275768c05d1af78328e957e781"
    else
      url "https://github.com/makewand/makewand/releases/download/v0.1.10/makewand_v0.1.10_darwin_amd64.tar.gz"
      sha256 "b9cfd8eee6512fe7b529d0340bb1fd208c2c790956b8ff450708377e14fb88a5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/makewand/makewand/releases/download/v0.1.10/makewand_v0.1.10_linux_arm64.tar.gz"
      sha256 "ca1cca15d0d4178a3dddbc8a5c993486c7af456e716873c557af6fa3c4b88dd7"
    else
      url "https://github.com/makewand/makewand/releases/download/v0.1.10/makewand_v0.1.10_linux_amd64.tar.gz"
      sha256 "91403a01c2582b3477a749da1a469ab502d5a9519e5154db4eb45ae26730fe3e"
    end
  end

  def install
    bin.install Dir["*/makewand"].first
  end

  test do
    assert_match "makewand version", shell_output("#{bin}/makewand --version")
  end
end
