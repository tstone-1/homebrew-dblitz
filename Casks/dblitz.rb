cask "dblitz" do
  arch arm: "aarch64", intel: "x64"

  version "26.7.0"
  sha256 arm:   "6516f03b6e1599f71cbab1fb4fde211f7bc9d969f2b25ded6c1ad6c4f45ee362",
         intel: "cb76d240847ed2c9fd6f22a97e8cd2f206523abb9d9e1cf89e5ae2a0938e189b"

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
