/* Project: Checker Game for MacOS
 Project for WWDC 2023
 Author: Khang Nguyen Huynh
 Finished on April 15th, 2023
 GamePlay file - Application Entry Point
 
 Note: For the best experience, please open the app in full screen mode
 */

import SwiftUI

/// The main entry point for the WWDC23 Checkers Game application
///
/// This structure defines the app's lifecycle and initial view hierarchy.
/// The app launches directly to the main menu where players can choose
/// between Player vs Player, Player vs Computer, or view the tutorial.
@main
struct GamePlay: App {
    var body: some Scene {
        WindowGroup {
            // Launch the main menu as the initial screen
            MainMenu(menu: .constant(true))
        }
    }
}
