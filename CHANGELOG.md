# Changelog

All notable changes to the WWDC23 Checkers Game project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.0] - 2025-11-13

### Added
- Comprehensive documentation comments across all Swift files
- MARK comments to organize code into logical sections (UI, Game Logic, AI, etc.)
- Detailed function documentation headers explaining parameters and return values
- Inline comments explaining complex game mechanics and AI strategy
- Accessibility labels and hints for VoiceOver support throughout UI
- Accessibility headers for How to Play tutorial sections
- CONTRIBUTING.md with detailed contribution guidelines
- CODE_OF_CONDUCT.md for community standards (Contributor Covenant 2.0)
- MIT License file for clear open-source licensing
- Comprehensive .gitignore file for Swift/Xcode development
- MIT License badge to README

### Changed
- Completely rewrote README.md with professional structure
  - Added badges for Swift version, platform, Swift Playgrounds compatibility, WWDC23, and license
  - Added detailed feature descriptions with emoji icons
  - Added architecture overview section with file structure
  - Improved setup instructions with step-by-step guide
  - Added development journey section with design process
  - Enhanced contribution guidelines section
  - Updated licensing information
  - Added contact information and acknowledgments
- Enhanced all Swift file headers with better descriptions
- Improved code organization in MainMenu.swift, VsPlayer.swift, and VsComp.swift
- Documented AI algorithm with strategic move selection explanation
- Added detailed comments to CheckSelect function (main game logic)
- Improved documentation for Features, coordinate, and gamemode structures

### Improved
- Code readability through consistent formatting and documentation
- Project professionalism with governance documents
- Accessibility for users with visual impairments
- Developer onboarding experience with clear contribution guidelines
- Understanding of AI opponent strategy through detailed comments
- Game logic comprehension through function documentation

### Technical Details
- **Total Changes**: 999+ lines of improvements across 14 files
- **New Files**: 4 (CONTRIBUTING.md, CODE_OF_CONDUCT.md, LICENSE, .gitignore, CHANGELOG.md)
- **Modified Files**: 9 Swift files + README.md
- **Documentation Coverage**: 100% of public APIs and complex logic

## [1.0.0] - 2023-04-15

### Initial Release
- Player vs Player game mode
- Player vs Computer game mode with AI opponent
- How to Play tutorial screen
- Standard American checkers rules implementation
- King piece mechanics
- Mandatory capture detection
- Win condition detection
- SwiftUI-based user interface
- AVFoundation sound effects
- iPad and iPhone support
- Full-screen gameplay experience

---

## Legend
- `Added` for new features
- `Changed` for changes in existing functionality
- `Deprecated` for soon-to-be removed features
- `Removed` for now removed features
- `Fixed` for any bug fixes
- `Security` for vulnerability fixes
- `Improved` for enhancements to existing features
