/* Project: Checker Game for MacOS
Project for WWDC 2023
Author: Khang Nguyen Huynh
Finished on April 15th, 2023
GamePlay file (main file)
Please open full screen before play the game
*/

import SwiftUI
@main
struct GamePlay: App {
    var body: some Scene {
        WindowGroup {
            // Main Menu appear
            MainMenu(menu:.constant(true))
        }
    }
}
