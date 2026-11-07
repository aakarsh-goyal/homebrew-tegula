cask "tegula" do
  version "1.0.0"
  sha256 "8b4c2718381f04fd66c9e930014b4660b47e0ba0dcc640bd9af49c06013f0054"

  url "https://github.com/aakarsh-goyal/tegula/releases/download/v#{version}/Tegula-#{version}-arm64.zip"
  name "Tegula"
  desc "Event-driven automatic window tiling for macOS"
  homepage "https://github.com/aakarsh-goyal/tegula"

  depends_on arch: :arm64
  depends_on macos: ">= :sequoia"

  app "Tegula.app"

  # Ad-hoc signed, not notarized: clear the download quarantine flag so it launches.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Tegula.app"]
  end

  zap trash: [
    "~/Library/Logs/Tegula.log",
    "~/Library/Preferences/com.aakarsh.tegula.plist",
  ]
end
