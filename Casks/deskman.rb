cask "deskman" do
  version "0.4.0"
  sha256 "20559858a63fcc4bbc1e9d7150ea5606ddfb32462a89f7d4463a12eb569b0a2f"

  url "https://github.com/todayporton/deskman/releases/download/v#{version}/Deskman-#{version}.zip"
  name "Deskman"
  desc "Name desktops (Spaces) and switch to them instantly by name"
  homepage "https://github.com/todayporton/deskman"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Deskman.app"
  binary "#{appdir}/Deskman.app/Contents/MacOS/deskman"

  uninstall quit: "online.todayporton.deskman"

  zap trash: "~/.config/deskman"

  caveats <<~EOS
    Deskman is not notarized. On first launch, macOS blocks it; open
    System Settings > Privacy & Security and click "Open Anyway".

    Switching desktops needs Accessibility access for Deskman.app:
    System Settings > Privacy & Security > Accessibility.
  EOS
end
