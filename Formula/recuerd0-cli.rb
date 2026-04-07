class Recuerd0Cli < Formula
  desc "CLI for preserving, versioning, and organizing knowledge from AI conversations"
  homepage "https://github.com/maquina-app/recuerd0-cli"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maquina-app/recuerd0-cli/releases/download/v#{version}/recuerd0-darwin-arm64"
      sha256 "d361ebb6a89b75c8753b94158f0f0b3b6fc59bde1b20256e046f57a97e56484e"
    else
      url "https://github.com/maquina-app/recuerd0-cli/releases/download/v#{version}/recuerd0-darwin-amd64"
      sha256 "26c25800f767e769807153f066e9f99cbad9e5aa63b96f97224d50eb44545109"
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
