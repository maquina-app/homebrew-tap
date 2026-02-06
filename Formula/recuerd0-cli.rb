class Recuerd0Cli < Formula
  desc "CLI for preserving, versioning, and organizing knowledge from AI conversations"
  homepage "https://github.com/maquina-app/recuerd0-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maquina-app/recuerd0-cli/releases/download/v#{version}/recuerd0-darwin-arm64"
      sha256 "Not"
    else
      url "https://github.com/maquina-app/recuerd0-cli/releases/download/v#{version}/recuerd0-darwin-amd64"
      sha256 "Not"
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
