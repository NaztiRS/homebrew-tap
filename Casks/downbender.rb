cask "downbender" do
  version "1.7.1"
  sha256 "2742af4e636017a267808e2c64077cbc3e4a3c8cfdb33139916ea28e8c6fabec"

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
