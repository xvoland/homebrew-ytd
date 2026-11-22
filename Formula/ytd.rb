class Ytd < Formula
  desc "Terminal video downloader with a live thumbnail preview"
  homepage "https://dotoca.net/ytd"
  url "https://github.com/xvoland/ytd/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "b3e038cc4c85c940d292380c967606504a339ef2cdea5d4ca1b3d78a16561ae2"
  version "0.1.5"

  depends_on "go" => :build
  depends_on "yt-dlp"

  def install
    ldflags = "-s -w -X main.version=#{version} -X main.buildSource=#{version}"
    system "go", "build", "-ldflags", ldflags, "-o", bin/"ytd", "."

    if OS.mac?
      # Ad-hoc sign the binary so Gatekeeper accepts it without the
      # "developer cannot be verified" prompt.
      system "codesign", "--force", "--timestamp=none", "--sign", "-", bin/"ytd"
      # Strip any quarantine attribute inherited from the downloaded source.
      system "xattr", "-dr", "com.apple.quarantine", bin/"ytd" rescue nil
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ytd --version")
  end
end
