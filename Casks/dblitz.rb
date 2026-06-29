cask "dblitz" do
  arch arm: "aarch64", intel: "x64"

  version "26.6.10"
  sha256 arm:   "82e49c3b63c3528bc382f04a190d99837abd6abde9a60f23ae376671d715604e",
         intel: "e96efef92e5457ab4489d7aced1c365ecf34c7da9b8e2e463f69bceb2476bce6"

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
