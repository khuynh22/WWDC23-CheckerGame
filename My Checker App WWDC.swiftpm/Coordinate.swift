/* Project: Checker Game for MacOS
 Project for WWDC 2023
 Author: Khang Nguyen Huynh
 Finished on April 15th, 2023
 Coordinate file
 */

import Foundation
import SwiftUI

/// Represents a position on the 8x8 checkers game board
///
/// The coordinate system uses zero-indexed positions:
/// - x: Row index (0-7, top to bottom)
/// - y: Column index (0-7, left to right)
struct coordinate {
    /// The row position on the board (0 at top, 7 at bottom)
    var x: Int
    
    /// The column position on the board (0 at left, 7 at right)
    var y: Int
}
