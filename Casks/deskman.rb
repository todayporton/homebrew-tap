cask "deskman" do
  version "0.4.1"
  sha256 "b8c5405ffd0865030123c0f99dbf82b75b411f0a3177261141de39ae7d41d1fa"

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
