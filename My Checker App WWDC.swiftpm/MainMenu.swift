/* Project: Checker Game for MacOS
 Project for WWDC 2023
 Author: Khang Nguyen Huynh
 Finished on April 15th, 2023
 MainMenu file - Landing Screen
 */

import SwiftUI
import AVFoundation

/// The main menu view that serves as the landing page for the game
///
/// This view presents three main options to the player:
/// 1. VS Player - Two human players on the same device
/// 2. VS Computer - Play against an AI opponent
/// 3. How to Play - View game rules and tutorial
///
/// Features a visually appealing background with the game logo and styled buttons.
struct MainMenu: View {
    // MARK: - State Properties
    
    /// Binding to control whether the menu is displayed
    @Binding var menu: Bool
    
    /// Controls navigation to Player vs Player mode
    @State private var MainScreen = false
    
    /// Controls navigation to Computer mode
    @State private var computermode = false
    
    /// Controls navigation to How to Play screen
    @State private var htp = false
    
    /// Tracks the currently selected game mode
    @State private var present: gamemode = .pvp
    
    /// Animation property for move transitions (currently unused)
    @State private var moveLength: Double = 50
    
    /// Opacity control for UI elements (currently unused)
    @State private var transparent: Double = 1
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            // Background image
            Image("startingScene")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .offset(x: 0, y: 0)
            
            VStack(spacing: 71) {
                // Logo and title
                HStack() {
                    Image("icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 114.29, height: 114.29)
                        .accessibilityLabel("Checkers game icon")
                    
                    Image("checkers")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 474, height: 116)
                        .offset(x: 20, y: 0)
                        .accessibilityLabel("Checkers game title")
                }
                .offset(x: -30, y: 130)
                
                // Menu buttons
                VStack(spacing: 71) {
                    // Player vs Player button
                    Button(action: {
                        MainScreen = true
                        present = .pvp
                    }, label: {
                        Image("VS PLAYER")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 260, height: 90)
                    })
                    .fullScreenCover(isPresented: $MainScreen, content: {
                        VsPlayer(MainScreen: $MainScreen, present: $present)
                    })
                    .accessibilityLabel("Play against another player")
                    .accessibilityHint("Start a two-player game on the same device")
                    
                    // Player vs Computer button
                    Button(action: {
                        computermode = true
                        present = .pve
                    }, label: {
                        Image("VS COMPUTER")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 260, height: 90)
                    })
                    .fullScreenCover(isPresented: $computermode, content: {
                        home(computermode: $computermode, present: $present)
                    })
                    .accessibilityLabel("Play against computer")
                    .accessibilityHint("Start a game against an AI opponent")
                    
                    // How to Play button
                    Button(action: {
                        htp = true
                        present = .howtoplay
                    }, label: {
                        Image("How to play")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 260, height: 90)
                    })
                    .fullScreenCover(isPresented: $htp, content: {
                        HowToPlay(htp: $htp, MainScreen: $MainScreen, present: $present)
                    })
                    .accessibilityLabel("How to play")
                    .accessibilityHint("Learn the rules and instructions for playing checkers")
                }
                .offset(x: 0, y: 130)
            }
            .offset(x: -520, y: -120)
        }
        .frame(width: .infinity, height: .infinity, alignment: .center)
    }
}

// MARK: - Preview Provider

struct MainMenuview: PreviewProvider {
    static var previews: some View {
        MainMenu(menu: .constant(true))
    }
}
