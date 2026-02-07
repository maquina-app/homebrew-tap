class Recuerd0Cli < Formula
  desc "CLI for preserving, versioning, and organizing knowledge from AI conversations"
  homepage "https://github.com/maquina-app/recuerd0-cli"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maquina-app/recuerd0-cli/releases/download/v#{version}/recuerd0-darwin-arm64"
      sha256 "f05e07562650d2d7685fb06f16117f16d7004a2d181f538db0bd612882a91cfb"
    else
      url "https://github.com/maquina-app/recuerd0-cli/releases/download/v#{version}/recuerd0-darwin-amd64"
      sha256 "20105a869c4197b04ff3a341ca06c0d3d73af0d9174d4ab39239e531b67a16ef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maquina-app/recuerd0-cli/releases/download/v#{version}/recuerd0-linux-arm64"
    else
      url "https://github.com/maquina-app/recuerd0-cli/releases/download/v#{version}/recuerd0-linux-amd64"
    end
  end

  def install
    binary_name = Dir["recuerd0-*"].first
    bin.install binary_name => "recuerd0"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/recuerd0 version")
  end
end
