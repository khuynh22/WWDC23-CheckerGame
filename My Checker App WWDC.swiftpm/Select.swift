/* Project: Checker Game for MacOS
 Project for WWDC 2023
 Author: Khang Nguyen Huynh
 Finished on April 15th, 2023
 Select file
 */

import Foundation

/// Defines the available game modes in the application
///
/// This enumeration is used for navigation and state management
/// to determine which screen or gameplay mode is currently active.
enum gamemode {
    /// Player versus Player mode - two human players on the same device
    case pvp
    
    /// Player versus Environment (Computer) mode - human vs AI opponent
    case pve
    
    /// How to Play tutorial screen - displays game rules and instructions
    case howtoplay
}
