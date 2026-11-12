cask "tegula" do
  version "1.1.0"
  sha256 "265adfc8c7d58385d372b7b58780e11ff6bd892b13de98e1ef629bfd7fb58e91"

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
