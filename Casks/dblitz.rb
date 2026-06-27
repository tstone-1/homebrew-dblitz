cask "dblitz" do
  arch arm: "aarch64", intel: "x64"

  version "26.6.9"
  sha256 arm:   "d259572793e18ba26f56ef02fdf6f476a632ec93a3e41e702315396fdf212232",
         intel: "ef319f7745aba8897565356c72fbdfa8e1cd01a4e3297553e999cc97c0a7b3dd"

  url "https://github.com/tstone-1/dblitz/releases/download/v#{version}/dblitz_#{version}_#{arch}.dmg"
  name "dblitz"
  desc "Fast read-only SQLite browser"
  homepage "https://github.com/tstone-1/dblitz"

  app "dblitz.app"

  zap trash: [
    "~/Library/Application Support/com.tstone.dblitz",
    "~/Library/Preferences/com.tstone.dblitz.plist",
    "~/Library/Saved Application State/com.tstone.dblitz.savedState",
  ]
end
