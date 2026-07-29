cask "dblitz" do
  arch arm: "aarch64", intel: "x64"

  version "26.7.7"
  sha256 arm:   "002bc74b72d77bd6806ea00ee3b9ef047af8d37262c0560d806c3f66982cfc14",
         intel: "ac62a8f2b84f16725374651ac9de7272b11e5de96b69f8a1f314ded48c9c070d"

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
