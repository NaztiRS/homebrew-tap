cask "downbender" do
  version "1.0.0"
  sha256 "a416582678c8f5c0f33c2ea75136a879eba4a755970be3b2886eddd5dfa4c873"

  url "https://github.com/NaztiRS/downbender/releases/download/v#{version}/Downbender.dmg",
      verified: "github.com/NaztiRS/downbender/"
  name "Downbender"
  desc "Download videos or extract MP3, natively on your Mac — powered by yt-dlp"
  homepage "https://naztirs.github.io/downbender/"

  auto_updates true
  depends_on macos: ">= :tahoe"
  depends_on arch: :arm64

  app "Downbender.app"

  caveats <<~EOS
    Downbender is free software (GPLv3) and is not notarized by Apple.
    On first launch macOS will block it once: open
    System Settings → Privacy & Security and click "Open Anyway",
    or clear the quarantine flag instead:

      xattr -dr com.apple.quarantine "/Applications/Downbender.app"
  EOS

  zap trash: [
    "~/Library/Application Support/Downbender",
    "~/Library/Preferences/com.naztirs.downbender.plist",
    "~/Library/Saved Application State/com.naztirs.downbender.savedState",
  ]
end
