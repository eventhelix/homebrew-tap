class Visualether < Formula
  desc "Generate sequence diagrams from Wireshark PCAP files"
  homepage "https://www.eventhelix.com/visualether"
  url "https://downloads.eventhelix.com/visualether/9.1.4/visualether-9.1.4-macos-arm64.tar.gz"
  version "9.1.4"
  sha256 "5815dbd1ce520bc3ce523a344bbf5e1805ab8d8db272578cccc5aeeeb5cb6317"
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
