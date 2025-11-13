# Contributing to WWDC23 Checkers Game

First off, thank you for considering contributing to the WWDC23 Checkers Game! It's people like you that make this project better for everyone.

## 🎯 Project Goals

This project was created for the WWDC23 Student Scholarship with the following goals:
- Provide an accessible, educational checkers game
- Demonstrate SwiftUI best practices
- Create an engaging learning experience for younger players
- Showcase game development with Swift Playgrounds

## 🤝 How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check the [existing issues](https://github.com/khuynh22/WWDC23-CheckerGame/issues) to avoid duplicates.

When you create a bug report, please include:
- **Clear descriptive title**
- **Detailed steps to reproduce** the problem
- **Expected behavior** vs **actual behavior**
- **Screenshots or videos** if applicable
- **Device and OS version** (e.g., iPad Pro, iOS 16.4)
- **Swift Playgrounds version**

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion, please include:
- **Clear descriptive title**
- **Detailed description** of the proposed functionality
- **Why this enhancement would be useful** to most users
- **Examples** from other games/apps if applicable

### Code Contributions

1. **Fork the repository** and create your branch from `main`
2. **Make your changes** following our coding standards
3. **Test your changes** thoroughly
4. **Commit your changes** with clear, descriptive messages
5. **Push to your fork** and submit a pull request

## 💻 Development Setup

1. Clone your fork:
   ```bash
   git clone https://github.com/YOUR-USERNAME/WWDC23-CheckerGame.git
   cd WWDC23-CheckerGame
   ```

2. Open in Swift Playgrounds:
   - Launch Swift Playgrounds
   - Open `My Checker App WWDC.swiftpm`

3. Make your changes and test thoroughly

## 📝 Coding Standards

### Swift Style Guidelines

- Follow [Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/)
- Use clear, descriptive names for variables and functions
- Add documentation comments for public functions
- Keep functions focused on a single responsibility

### Code Organization

- Use `// MARK: -` comments to organize code sections
- Group related functionality together
- Keep files under 1000 lines when possible

### Documentation

- Add doc comments for all public types and functions
- Explain complex game logic with inline comments
- Update README.md for user-facing changes

### Example Code Style

```swift
/// Determines if a move is valid according to checkers rules
/// - Parameters:
///   - from: Starting position of the piece
///   - to: Destination position
/// - Returns: True if the move is legal, false otherwise
func isValidMove(from: coordinate, to: coordinate) -> Bool {
    // Check bounds
    guard to.x >= 0 && to.x < 8 && to.y >= 0 && to.y < 8 else {
        return false
    }
    
    // Add more validation logic...
    return true
}
```

## 🎨 UI/UX Guidelines

- Maintain consistent visual style with existing screens
- Ensure accessibility features work properly
- Test on both iPad and iPhone if making UI changes
- Consider color-blind users when choosing colors
- Add VoiceOver labels and hints for new interactive elements

## 🧪 Testing

Before submitting a pull request:
- [ ] Test in both Player vs Player and Player vs Computer modes
- [ ] Verify all game rules work correctly
- [ ] Test on iPad and iPhone (if applicable)
- [ ] Check that the game resets properly
- [ ] Ensure no crashes or unexpected behavior
- [ ] Test with VoiceOver enabled

## 📋 Pull Request Process

1. **Update documentation** if you're changing functionality
2. **Follow the coding standards** outlined above
3. **Keep PRs focused** - one feature or bug fix per PR
4. **Write a clear PR description** explaining:
   - What changes you made
   - Why you made them
   - How to test the changes
5. **Link related issues** using keywords (e.g., "Fixes #123")
6. **Be responsive** to code review feedback

### PR Title Format

Use descriptive titles:
- `Add: New feature description`
- `Fix: Bug description`
- `Improve: Enhancement description`
- `Docs: Documentation update`

### Example PR Description

```markdown
## Description
Add double-jump validation to prevent skipping mandatory captures

## Changes
- Modified `CheckEat()` to detect multi-jump opportunities
- Added highlighting for consecutive capture paths
- Updated UI to show available jump chains

## Testing
- Tested with multiple consecutive captures
- Verified forced jump rules are enforced
- Checked edge cases (king pieces, board edges)

Fixes #42
```

## 🎓 Learning Resources

If you're new to Swift or SwiftUI:
- [Swift Official Documentation](https://swift.org/documentation/)
- [SwiftUI Tutorials](https://developer.apple.com/tutorials/swiftui)
- [Swift Playgrounds](https://www.apple.com/swift/playgrounds/)
- [WWDC Videos](https://developer.apple.com/videos/)

## 🌟 Recognition

Contributors will be acknowledged in:
- The README.md file
- Release notes for versions including their contributions

## 📜 Code of Conduct

### Our Standards

- Be respectful and inclusive
- Welcome newcomers and help them learn
- Focus on constructive feedback
- Accept responsibility for mistakes

### Unacceptable Behavior

- Harassment or discriminatory language
- Trolling or insulting comments
- Publishing private information
- Any conduct that would be inappropriate in a professional setting

## 📧 Contact

For questions about contributing:
- Open an issue for general questions
- Email: timhuynhwork@gmail.com for private inquiries

## 📄 License

By contributing to this project, you agree that your contributions will be subject to the same terms as the original project.

---

Thank you for contributing to make this checkers game better! 🎮✨
