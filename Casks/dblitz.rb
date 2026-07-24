cask "dblitz" do
  arch arm: "aarch64", intel: "x64"

  version "26.7.5"
  sha256 arm:   "0e51a46f8a84bc23dfd9b4c6b4dae5ba5f7be31c61ea7ceef24a175f145ca512",
         intel: "aaa1533d2997ebd6747d16bffda310bd15d2f436e931f48e2e3aebb9e6e8fe15"

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
