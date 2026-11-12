cask "tegula" do
  version "1.1.3"
  sha256 "a07086590e26d7424d8bc39f506cf6d515f70252152e795020ef677eac42d351"

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
