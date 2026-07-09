cask "dblitz" do
  arch arm: "aarch64", intel: "x64"

  version "26.7.1"
  sha256 arm:   "b09e896e9a609f0e68115232f240bb831814a4c82259759fd1ce47c3652f643a",
         intel: "c1b0ac8f778094e8c61f6e8c1433f85a236a0c3a008e53e8fcbc447a5b900afb"

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
