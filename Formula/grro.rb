# Homebrew formula for the Grro Cloud CLI. Lives in github.com/grro-cloud/homebrew-tap
# as Formula/grro.rb; written by scripts/publish_cli.sh.
class Grro < Formula
  desc "Grro Cloud command line tool: deploy, logs, variables, domains and databases"
  homepage "https://usegrro.com/docs/cli"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/grro-cloud/cli/releases/download/v1.0.0/grro-darwin-arm64"
      sha256 "00f5f6e23899abc0036799eea33ff120ae3e3fa5f8673c81cb6f09d809044bd7"
    else
      url "https://github.com/grro-cloud/cli/releases/download/v1.0.0/grro-darwin-amd64"
      sha256 "c695bc9279e3374568e916dfc9ed06a8d39e271931a32758a3b51cb483a1def1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/grro-cloud/cli/releases/download/v1.0.0/grro-linux-arm64"
      sha256 "2088eebafe71dba9691a2987bf1b75f09800a8889f0957f7a7e600e46978a7e7"
    else
      url "https://github.com/grro-cloud/cli/releases/download/v1.0.0/grro-linux-amd64"
      sha256 "2c7cac287a57adf218884a57a019dbc470d75e45724b7f88d8641b9b6659b1a0"
    end
  end

  def install
    bin.install Dir["grro-*"].first => "grro"
    generate_completions_from_executable(bin/"grro", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/grro version")
  end
end
