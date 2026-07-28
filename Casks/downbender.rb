cask "downbender" do
  version "1.7.0"
  sha256 "87ded6e849105b8d11b7a78884fb27ea268bf47d474936debcc05ff6707c49ea"

  url "https://github.com/NaztiRS/downbender/releases/download/v#{version}/Downbender.dmg",
      verified: "github.com/NaztiRS/downbender/"
  name "Downbender"
  desc "Video downloader and MP3 extractor powered by yt-dlp"
  homepage "https://naztirs.github.io/downbender/"

  auto_updates true
  depends_on macos: :tahoe
  depends_on arch: :arm64

  app "Downbender.app"

  zap trash: [
    "~/Library/Application Support/Downbender",
    "~/Library/Preferences/com.naztirs.downbender.plist",
    "~/Library/Saved Application State/com.naztirs.downbender.savedState",
  ]

  caveats <<~EOS
    Downbender is free software (GPLv3) and is not notarized by Apple.
    On first launch macOS will block it once: open
    System Settings → Privacy & Security and click "Open Anyway",
    or clear the quarantine flag instead:

      xattr -dr com.apple.quarantine "/Applications/Downbender.app"
  EOS
end
