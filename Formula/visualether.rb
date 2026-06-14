class Visualether < Formula
  desc "Generate sequence diagrams from Wireshark PCAP files"
  homepage "https://www.eventhelix.com/visualether"
  url "https://downloads.eventhelix.com/visualether/9.0.6/visualether-9.0.6-macos-arm64.tar.gz"
  version "9.0.6"
  sha256 "44ce5d0d23043ef988f654be37a31ec7523992ff5f2c691e3e61b2b5d084703e"
  license :cannot_represent # proprietary — EventHelix.com Inc.

  # arm64-only: Intel Macs are not supported. Gives a clear message instead of
  # a broken install.
  depends_on arch: :arm64
  # tshark (Wireshark CLI) is required at runtime to parse PCAPs.
  depends_on "wireshark"

  def install
    bin.install "visualether"
    pkgshare.install "samples", "documents"
    doc.install "README.md"
  end

  def caveats
    <<~EOS
      Bundled samples and documentation were installed to:
        #{opt_pkgshare}

      VisualEther uses tshark (installed via the wireshark dependency) to read
      PCAP captures. Verify it is on PATH with:  tshark --version
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/visualether --version")
  end
end
