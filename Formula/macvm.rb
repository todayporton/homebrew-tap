class Macvm < Formula
  desc "Run macOS GUI tests in a shared headless Tart VM, leaving the host GUI alone"
  homepage "https://github.com/poTKC/macvm"
  url "https://github.com/poTKC/macvm/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "eb0b2172968c105b226c13c83e451d3173da1511dc7dd3401fd332f95ba29362"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  def caveats
    <<~EOS
      Run `macvm setup` to install Tart if needed and create the VM (about 26 GB download).
      Before `brew uninstall macvm`, run `macvm teardown --yes` to remove user data,
      adding --delete-vm to delete the VM as well.
    EOS
  end

  test do
    assert_match "macvm", shell_output("#{bin}/macvm version")
  end
end
