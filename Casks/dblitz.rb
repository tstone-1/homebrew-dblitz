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

  # dblitz ships an in-app updater (Tauri, minisign-signed payloads), so the
  # installed .app can be a newer version than this cask's `version`. Without
  # this, brew and the updater fight: `brew upgrade` reinstalls the cask version
  # over a self-updated app, and `brew outdated` reports dblitz as outdated
  # forever because the on-disk version never matches.
  auto_updates true

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

  # dblitz stores its config under the app NAME, not the bundle identifier:
  # `dirs::config_dir()` + "dblitz" (see src-tauri/src/config.rs). The
  # bundle-id path this used to list has never existed, so `--zap` left
  # app.json and every per-database view config behind. The Preferences and
  # Saved Application State paths below are genuinely bundle-id-keyed —
  # macOS writes those itself — so they stay as they are.
  zap trash: [
    "~/Library/Application Support/dblitz",
    "~/Library/Preferences/com.tstone.dblitz.plist",
    "~/Library/Saved Application State/com.tstone.dblitz.savedState",
  ]
end
