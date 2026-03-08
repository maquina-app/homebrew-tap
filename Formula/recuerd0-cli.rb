class Recuerd0Cli < Formula
  desc "CLI for preserving, versioning, and organizing knowledge from AI conversations"
  homepage "https://github.com/maquina-app/recuerd0-cli"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maquina-app/recuerd0-cli/releases/download/v#{version}/recuerd0-darwin-arm64"
      sha256 "0f8d10c052887bc3e5206407683ebbf68545df6b2bbcfad5e45f629a8f72b480"
    else
      url "https://github.com/maquina-app/recuerd0-cli/releases/download/v#{version}/recuerd0-darwin-amd64"
      sha256 "cc659a66d14790b8cadf74a16a246d0643d459417b4587f238143a77502a446a"
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
