cask "dblitz" do
  arch arm: "aarch64", intel: "x64"

  version "26.10.2"
  sha256 arm:   "efb1831176341bcf1a902164858a6122458d7a90c5bde3f94b24c8653f958e89",
         intel: "fdc0038c6f2a9141f67be73c952fd0f59796e316f9db6bd9642cf7465305335d"

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
