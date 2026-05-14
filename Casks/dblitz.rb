cask "dblitz" do
  arch arm: "aarch64", intel: "x64"

  version "26.5.0"
  sha256 arm:   "8df58400e451cd3f8de313cc1da82ae83ed0c010bba25470205070035723dbc1",
         intel: "c3198977bbfbb544cb7ef33466df8c3f9e7153f50cac150d081042eb6bb5febb"

  url "https://github.com/tstone-1/dblitz/releases/download/v#{version}/dblitz_#{version}_#{arch}.dmg",
      verified: "github.com/tstone-1/dblitz/"
  name "dblitz"
  desc "Fast read-only SQLite browser"
  homepage "https://github.com/tstone-1/dblitz"

  app "dblitz.app"

  zap trash: [
    "~/Library/Application Support/com.dblitz.app",
    "~/Library/Preferences/com.dblitz.app.plist",
    "~/Library/Saved Application State/com.dblitz.app.savedState",
  ]
end
