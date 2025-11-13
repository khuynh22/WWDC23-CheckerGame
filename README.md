# 🎮 WWDC23 Checkers Game

[![Swift](https://img.shields.io/badge/Swift-5.8-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/Platform-iOS%2016.0%2B-blue.svg)](https://developer.apple.com/ios/)
[![Swift Playgrounds](https://img.shields.io/badge/Swift%20Playgrounds-Compatible-green.svg)](https://www.apple.com/swift/playgrounds/)
[![WWDC23](https://img.shields.io/badge/WWDC23-Student%20Scholarship-red.svg)](https://developer.apple.com/wwdc23/)

<img width="1512" alt="WWDC23 Checkers Game Main Screen" src="https://user-images.githubusercontent.com/57774658/235327043-3af8cbe1-76ad-4f13-94a1-31a3f27cdc6c.png">

An elegant, educational checkers game built with SwiftUI for the WWDC23 Student Scholarship. This project bridges the gap in the macOS gaming landscape while providing an accessible platform for younger players to learn the timeless strategy game of checkers.

## 🌟 Highlights

- **User-Centered Design**: Developed through iterative Figma prototyping with user testing from 6 participants
- **AI-Powered Opponent**: Intelligent computer player using strategic algorithms for engaging gameplay
- **Educational Focus**: Built-in tutorial system perfect for beginners learning checkers
- **Native Performance**: Leverages SwiftUI and modern Apple frameworks for smooth, responsive gameplay
- **Accessibility First**: Designed with inclusivity in mind for players of all skill levels

## ✨ Features

### Game Modes
- **👥 Player vs Player**: Classic two-player mode for head-to-head matches
- **🤖 Player vs Computer**: Challenge an AI opponent with strategic move selection
- **📚 How to Play**: Interactive tutorial explaining checkers rules and gameplay

### Gameplay Features
- ✅ Full checkers ruleset implementation
- 👑 King pieces with bidirectional movement
- 🎯 Mandatory capture detection
- 🔄 Multiple consecutive jumps
- 🎨 Beautiful, intuitive game board interface
- 🎵 Immersive sound effects (AVFoundation)
- 🏆 Win condition detection

### Technical Features
- Modern SwiftUI architecture
- Declarative UI patterns
- Efficient state management
- Smooth animations and transitions
- Responsive layout supporting iPad and iPhone

## 🏗️ Architecture

The project follows a clean SwiftUI architecture with clear separation of concerns:

```
My Checker App WWDC.swiftpm/
├── GamePlay.swift      # App entry point
├── MainMenu.swift      # Main menu view
├── VsPlayer.swift      # Player vs Player game logic
├── VsComp.swift        # Player vs Computer with AI
├── HowToPlay.swift     # Tutorial screen
├── Features.swift      # Checker piece model
├── Coordinate.swift    # Board position structure
├── Select.swift        # Game mode enumeration
└── Assets.xcassets/    # Images and visual assets
```

### Key Components

- **Game State Management**: Efficient 2D array-based board representation
- **Move Validation**: Comprehensive logic for legal moves and captures
- **AI Algorithm**: Strategic move selection with capture prioritization
- **King Promotion**: Automatic piece upgrade at board edges

## 🚀 Getting Started

### Prerequisites
- macOS 12.0 or later
- Swift Playgrounds 4.0+ (available on Mac App Store)
- Xcode 14.0+ (optional, for advanced development)

### Installation

1. **Download Swift Playgrounds**
   ```bash
   # Install from Mac App Store or visit:
   # https://apps.apple.com/app/swift-playgrounds/id1496833156
   ```

2. **Clone the Repository**
   ```bash
   git clone https://github.com/khuynh22/WWDC23-CheckerGame.git
   cd WWDC23-CheckerGame
   ```

3. **Open the Project**
   - Launch Swift Playgrounds
   - Select "Open" and navigate to `My Checker App WWDC.swiftpm`
   - Click "Open"

4. **Run the Game**
   - Click the "Run" button in Swift Playgrounds
   - For the best experience, run in full-screen mode (View → Full Screen or ⌃⌘F)
   - Supports both iPad and Mac devices

### Quick Start Guide

1. Launch the app and select your preferred game mode
2. In Player vs Player mode, black moves first
3. Click a piece to select it, then click a highlighted square to move
4. Captures are mandatory when available
5. Reach the opposite end to crown your piece as a King
6. Win by capturing all opponent pieces or blocking all their moves

## 🛠️ Technologies & Frameworks

| Technology | Purpose |
|------------|---------|
| **SwiftUI** | Modern declarative UI framework for building responsive interfaces |
| **AVFoundation** | Audio playback for engaging sound effects |
| **Swift 5.8** | Powerful, type-safe programming language |
| **Swift Playgrounds** | Interactive development environment optimized for learning |

## 📖 Development Journey

<img width="1512" alt="Design Process with Figma" src="https://user-images.githubusercontent.com/57774658/235327699-83bc25fa-9174-479f-bd3c-352442052b17.png">

### Design Phase
1. **Wireframing**: Created initial designs in Figma focusing on clarity and usability
2. **User Testing**: Conducted testing sessions with 6 participants to gather feedback
3. **Iteration**: Refined design based on user insights and accessibility considerations

<img width="1512" alt="Development in Swift Playgrounds" src="https://user-images.githubusercontent.com/57774658/235327766-8bbe1058-5ca7-4ac5-ba4f-02f898b7e30f.png">

### Implementation Phase
1. **Core Logic**: Built game rules engine with move validation
2. **AI Development**: Implemented strategic computer opponent
3. **UI Polish**: Created smooth animations and responsive layouts
4. **Testing**: Ensured robust gameplay across various scenarios

This project deepened my understanding of Swift, SwiftUI, and game development principles. The WWDC Student Scholarship opportunity was instrumental in motivating this learning journey.

## 🤝 Contributing

Contributions are welcome! Whether you're fixing bugs, improving documentation, or proposing new features, your help is appreciated.

### How to Contribute

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Reporting Issues

Found a bug or have a feature request? Please [open an issue](https://github.com/khuynh22/WWDC23-CheckerGame/issues) with:
- Clear description of the problem or suggestion
- Steps to reproduce (for bugs)
- Expected vs actual behavior
- Screenshots if applicable

## 📄 License

This project was created by **Khang Nguyen Huynh** for the WWDC23 Student Scholarship submission. 

While no formal open-source license is applied, the code is shared for educational purposes. If you'd like to use or build upon this project, please reach out via email at [timhuynhwork@gmail.com](mailto:timhuynhwork@gmail.com) to discuss.

## 🙏 Acknowledgments

- **Apple Inc.** - For the incredible WWDC Student Scholarship program and Swift Playgrounds platform
- **User Testers** - The 6 participants whose feedback shaped the final design
- **Swift Community** - For extensive documentation and learning resources
- **You** - For taking the time to explore this project!

## 📬 Contact

**Khang Nguyen Huynh**  
📧 Email: timhuynhwork@gmail.com  
🐙 GitHub: [@khuynh22](https://github.com/khuynh22)

---

<div align="center">
  <p>Built with ❤️ and Swift for WWDC23</p>
  <p>⭐ If you find this project helpful, please consider giving it a star!</p>
</div>
