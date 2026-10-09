class Makewand < Formula
  desc "AI coding assistant CLI"
  homepage "https://github.com/makewand/makewand"
  version "3.2.0"
  license "MIT"
  depends_on "python@3.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/makewand/makewand/releases/download/v3.2.0/makewand_v3.2.0_darwin_arm64.tar.gz"
      sha256 "1092520929b6edec26e772827e4988d1f24970fb257d352773083472fd4f2555"
    else
      url "https://github.com/makewand/makewand/releases/download/v3.2.0/makewand_v3.2.0_darwin_amd64.tar.gz"
      sha256 "7614ce67e3b6ab531acd8d85313f79b85cd36140598ea8f54283928a8cde1e57"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/makewand/makewand/releases/download/v3.2.0/makewand_v3.2.0_linux_arm64.tar.gz"
      sha256 "df75cc88b9def6aed59a6ac63378fa9a7ceef635503ecd060b9282c1ba0cbb4d"
    else
      url "https://github.com/makewand/makewand/releases/download/v3.2.0/makewand_v3.2.0_linux_amd64.tar.gz"
      sha256 "e60d45e32222ddafc1f25b503927ae6bf9757c83a5348c1d0085471363b712ad"
    end
  end

  def install
    bundle = File.exist?("makewand") ? Pathname.pwd : Pathname(Dir["*/makewand"].first).dirname
    libexec.install bundle/"makewand", bundle/"lib"
    (bin/"makewand").write_env_script libexec/"makewand", PATH: "#{Formula["python@3.12"].opt_libexec}/bin:#{ENV["PATH"]}"
  end

  test do
    assert_match "makewand version", shell_output("#{bin}/makewand --version")
    assert_match "usage:", shell_output("#{bin}/makewand run --help")
  end
end
