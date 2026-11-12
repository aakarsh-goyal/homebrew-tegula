cask "tegula" do
  version "1.1.2"
  sha256 "ccb08e127dea93f4bc0d24a91fd611d769a9fe847131d44ebebbab2143df1694"

  url "https://github.com/aakarsh-goyal/tegula/releases/download/v#{version}/Tegula-#{version}-arm64.zip"
  name "Tegula"
  desc "Event-driven automatic window tiling for macOS"
  homepage "https://github.com/aakarsh-goyal/tegula"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Tegula.app"

  # Ad-hoc signed, not notarized: clear the download quarantine flag so it launches.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "/Applications/Tegula.app"],
                          must_succeed: false
  end

  zap trash: [
    "~/Library/Logs/Tegula.log",
    "~/Library/Preferences/com.aakarsh.tegula.plist",
  ]
end
