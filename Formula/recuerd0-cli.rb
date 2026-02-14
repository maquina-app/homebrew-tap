class Recuerd0Cli < Formula
  desc "CLI for preserving, versioning, and organizing knowledge from AI conversations"
  homepage "https://github.com/maquina-app/recuerd0-cli"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maquina-app/recuerd0-cli/releases/download/v#{version}/recuerd0-darwin-arm64"
      sha256 "132dcfe821e0cb335a365b7990de4950ae83221454421a192f0c754e40388542"
    else
      url "https://github.com/maquina-app/recuerd0-cli/releases/download/v#{version}/recuerd0-darwin-amd64"
      sha256 "9e9c6f80a8452bcb38ff7474cc3aca665c7a7bc5be216c5328b5d390be58303d"
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
