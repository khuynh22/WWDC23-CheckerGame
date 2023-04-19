/* Project: Checker Game for MacOS
 Project for WWDC 2023
 Author: Khang Nguyen Huynh
 Finished on April 15th, 2023
 Features file
 */
import Foundation
import SwiftUI
struct Features {
    let id = UUID()
    var life: Bool = true
    var mark: Bool = false
    var color = Color.red
    var choose: Bool = false
    var transparent: Double = 0
    var imageName = "blackchecker"
}
