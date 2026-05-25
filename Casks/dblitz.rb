cask "dblitz" do
  arch arm: "aarch64", intel: "x64"

  version "26.5.4"
  sha256 arm:   "0668617f5d9558d5caefa2cd99651f440cc431438e251961638ad97d560c96b1",
         intel: "b5d6ed8967f7d7a2f383fbb6b6fce8e5cb72d528e6df505f1c50939556d246d1"

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
