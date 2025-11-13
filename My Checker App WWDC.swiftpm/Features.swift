/* Project: Checker Game for MacOS
 Project for WWDC 2023
 Author: Khang Nguyen Huynh
 Finished on April 15th, 2023
 Features file - Checker Piece Model
 */

import Foundation
import SwiftUI

/// Represents a single checker piece on the game board with all its properties
///
/// This structure encapsulates the state and visual properties of each square
/// on the checkers board, including whether it contains a piece, the piece's
/// team color, king status, and UI state for selection and highlighting.
struct Features {
    /// Unique identifier for this checker piece
    let id = UUID()
    
    /// Indicates if the piece is still in play (not captured)
    var life: Bool = true
    
    /// Indicates if this piece has been promoted to a King
    /// Kings can move both forward and backward on the board
    var mark: Bool = false
    
    /// The team color of the piece (red/orange for player 1, black for player 2)
    var color = Color.red
    
    /// Indicates if this piece is currently selected by the player
    var choose: Bool = false
    
    /// Opacity level for the piece (0.0 = invisible, 1.0 = fully visible)
    /// Used for showing/hiding pieces and highlighting available moves
    var transparent: Double = 0
    
    /// Asset name for the checker piece image
    /// Can be "blackchecker" or "redchecker" depending on the team
    var imageName = "blackchecker"
}
