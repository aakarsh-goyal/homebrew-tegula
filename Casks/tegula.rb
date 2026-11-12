cask "tegula" do
  version "1.1.1"
  sha256 "5672dff7ac51b417365d1d90170a5d4a565251583499aa6e1e8e16d4e05bda1f"

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
