cask "dblitz" do
  arch arm: "aarch64", intel: "x64"

  version "26.10.0"
  sha256 arm:   "ce5f7259b2b0656064ea0d72e50de6e25127771650ae890ce031251ee2705810",
         intel: "7e318efaa70b452a82f4a1bd1eb11f8592c2c5539714855b72d2670380e58b66"

  url "https://github.com/tstone-1/dblitz/releases/download/v#{version}/dblitz_#{version}_#{arch}.dmg"
  name "dblitz"
  desc "Fast read-only SQLite browser"
  homepage "https://github.com/tstone-1/dblitz"

  # dblitz ships an in-app updater (Tauri, minisign-signed payloads), so the
  # installed .app can be a newer version than this cask's `version`. Without
  # this, brew and the updater fight: `brew upgrade` reinstalls the cask version
  # over a self-updated app, and `brew outdated` reports dblitz as outdated
  # forever because the on-disk version never matches.
  auto_updates true
  depends_on :macos

  app "dblitz.app"

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
