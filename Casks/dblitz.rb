cask "dblitz" do
  arch arm: "aarch64", intel: "x64"

  version "26.7.2"
  sha256 arm:   "ffae75fb149d2362e29746fe9b0fe7bb7aae6a45f31294a5fa019925805f7346",
         intel: "5510a7f8036c6a57e429c9b9cb3ef647c4ab6a6fae33f1675ba2fe600da96db3"

  url "https://github.com/tstone-1/dblitz/releases/download/v#{version}/dblitz_#{version}_#{arch}.dmg"
  name "dblitz"
  desc "Fast read-only SQLite browser"
  homepage "https://github.com/tstone-1/dblitz"

  depends_on :macos

  app "dblitz.app"

  # The app is ad-hoc signed, not Apple-notarized, so Gatekeeper reports a
  # quarantined copy as "damaged and can't be opened". Strip the quarantine
  # flag Homebrew stamps on the install so it launches without that error.
  # (Direct .dmg downloads from GitHub Releases still need a manual
  # `xattr -dr com.apple.quarantine /Applications/dblitz.app`.)
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/dblitz.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.tstone.dblitz",
    "~/Library/Preferences/com.tstone.dblitz.plist",
    "~/Library/Saved Application State/com.tstone.dblitz.savedState",
  ]
end
