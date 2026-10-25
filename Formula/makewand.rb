class Makewand < Formula
  desc "AI coding assistant CLI"
  homepage "https://github.com/makewand/makewand"
  version "3.3.0"
  license "MIT"
  depends_on "python@3.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/makewand/makewand/releases/download/v3.3.0/makewand_v3.3.0_darwin_arm64.tar.gz"
      sha256 "f38c2f298eb34f7e3e7356dc68ace5432108d8957fa73d7cad8bf2b1b4b9fba0"
    else
      url "https://github.com/makewand/makewand/releases/download/v3.3.0/makewand_v3.3.0_darwin_amd64.tar.gz"
      sha256 "b9987fa893402a4ccc45e1258273613999b4f339b62baddad313e34e2faab7fe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/makewand/makewand/releases/download/v3.3.0/makewand_v3.3.0_linux_arm64.tar.gz"
      sha256 "10cd664ad2886d91b1fed0d999c7e7b02e99c38f4c1edb8e5221ebcec3572af1"
    else
      url "https://github.com/makewand/makewand/releases/download/v3.3.0/makewand_v3.3.0_linux_amd64.tar.gz"
      sha256 "b5a2c1bb361cfa61fd0c74c4178d52e8d8b546138661f1e7f86f57f8d48d0496"
    end
  end

  def install
    bundle = File.exist?("makewand") ? Pathname.pwd : Pathname(Dir["*/makewand"].first).dirname
    libexec.install bundle/"makewand", bundle/"lib"
    # Prepend only the engine's Python. The wrapper expands the caller's PATH
    # when it runs (brew's sanitized build-time PATH would hide provider CLIs
    # in ~/.local/bin, npm globals and HOMEBREW_PREFIX/bin), and an empty PATH
    # never turns into a current-directory entry.
    (bin/"makewand").write_env_script libexec/"makewand", PATH: "#{Formula["python@3.12"].opt_libexec}/bin${PATH:+:$PATH}"
  end

  test do
    assert_match "makewand version", shell_output("#{bin}/makewand --version")
    assert_match "usage:", shell_output("#{bin}/makewand run --help")
  end
end
