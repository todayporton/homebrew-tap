cask "deskman" do
  version "0.3.0"
  sha256 "54e88b28b51c3e5eaf5cf431e07418802ca8e95986d0d7c35c6526d411aa9bd3"

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
