# 🚀 Quick Start Guide

Get the WWDC23 Checkers Game up and running in under 5 minutes!

## Prerequisites Checklist

- [ ] macOS 12.0 or later
- [ ] Swift Playgrounds 4.0+ (from Mac App Store)
- [ ] Git installed (for cloning)

## Step 1: Get the Code

### Option A: Clone with Git (Recommended)
```bash
git clone https://github.com/khuynh22/WWDC23-CheckerGame.git
cd WWDC23-CheckerGame
```

### Option B: Download ZIP
1. Click the green "Code" button on GitHub
2. Select "Download ZIP"
3. Extract the downloaded file

## Step 2: Open in Swift Playgrounds

1. Launch **Swift Playgrounds** from your Applications folder
2. Click **"Open"** in the main window
3. Navigate to the cloned/extracted folder
4. Select **`My Checker App WWDC.swiftpm`**
5. Click **"Open"**

## Step 3: Run the Game

1. Once the project loads, click the **▶️ Run** button (top right)
2. Wait a few seconds for compilation
3. The game will launch in the preview window

### Pro Tip: Full Screen Mode
For the best experience, press **⌃⌘F** (Control + Command + F) to enter full-screen mode!

## Step 4: Play!

### Choose Your Mode

**👥 VS Player**
- Two-player mode on the same device
- Black moves first
- Take turns making moves

**🤖 VS Computer**
- Play against an AI opponent
- You control black pieces
- Computer controls red pieces

**📚 How to Play**
- Learn the rules of checkers
- Understand piece movement
- Master capture mechanics

## Quick Game Rules Reminder

1. **Black moves first** - diagonal moves only on dark squares
2. **Captures are mandatory** - if you can jump, you must!
3. **King me!** - reach the opposite end to become a king
4. **Kings move both ways** - forward and backward
5. **Win by elimination** - capture all opponent pieces or block all moves

## Troubleshooting

### "Swift Playgrounds won't open"
- Make sure you're on macOS 12.0 or later
- Update Swift Playgrounds from the Mac App Store

### "Project won't compile"
- Make sure you're using Swift Playgrounds 4.0+
- Try cleaning the build: **Product → Clean Build Folder**

### "Game doesn't respond to clicks"
- Make sure the game window has focus
- Try restarting the playground

### "Graphics look stretched"
- Use full-screen mode (⌃⌘F) for optimal layout
- The game is optimized for 1512px width

## Next Steps

### Want to Learn More?
- Read the [README.md](README.md) for full documentation
- Check out the [architecture overview](README.md#-architecture)
- Explore the codebase with inline documentation

### Want to Contribute?
- Read [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines
- Check existing [issues](https://github.com/khuynh22/WWDC23-CheckerGame/issues)
- Submit a pull request!

### Want to Modify?
- All game logic is in `VsPlayer.swift` and `VsComp.swift`
- UI components are in `MainMenu.swift` and `HowToPlay.swift`
- Colors and styles can be customized in the respective view files

## Development Tips

### Understanding the Code Structure
```
My Checker App WWDC.swiftpm/
├── GamePlay.swift      # App entry point - Start here!
├── MainMenu.swift      # Main menu UI
├── VsPlayer.swift      # PvP game logic (600+ lines)
├── VsComp.swift        # AI game logic (700+ lines)
├── HowToPlay.swift     # Tutorial screen
├── Features.swift      # Piece data model
├── Coordinate.swift    # Board position
└── Select.swift        # Game mode enum
```

### Key Functions to Explore
- `CheckSelect()` - Main game interaction logic
- `CheckMovement()` - Win condition detection
- `PouncedPosition()` - Capture move validation
- AI Strategy (in VsComp.swift) - Computer opponent logic

### Making Changes
1. Edit files in Swift Playgrounds
2. Changes auto-save
3. Click Run to see your changes
4. Test both game modes thoroughly

## Common Tasks

### Change Board Colors
Look for `MapColor()` function in `VsPlayer.swift`:
```swift
func MapColor(i: Int, j: Int) -> Color {
    // Modify these RGB values
    return Color(red: 161/255, green: 180/255, blue: 195/255)
}
```

### Adjust AI Difficulty
Check the AI selection logic in `VsComp.swift` around line 640:
```swift
// Strategy 2: Make captures more strategic
// Currently random - could be improved!
let tmp = Int.random(in: 0...eat.count-1)
```

### Add Sound Effects
The game uses AVFoundation. Import at top:
```swift
import AVFoundation
```

## Support

**Need Help?**
- 📧 Email: timhuynhwork@gmail.com
- 🐛 [Report a bug](https://github.com/khuynh22/WWDC23-CheckerGame/issues)
- 💬 [Start a discussion](https://github.com/khuynh22/WWDC23-CheckerGame/discussions)

## License

This project is licensed under the MIT License - feel free to use, modify, and learn from it!

---

**Enjoy the game! 🎮✨**

Made with ❤️ for WWDC23 Student Scholarship
