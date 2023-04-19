/* Project: Checker Game for MacOS
 Project for WWDC 2023
 Author: Khang Nguyen Huynh
 Finished on April 15th, 2023
 HowToPlay file
 */
import SwiftUI

struct HowToPlay: View {
    // existing state variables
    @Binding var htp:Bool
    @Binding var MainScreen:Bool
    @Binding var present:gamemode
    @State private var menu = false
    @State private var moveLength: Double = 50
    @State private var transparent: Double = 1
    
    // new state variable for How to Play scene
    @State private var howToPlayScreen = false
    
    var body: some View {
        ZStack {
            Image("Backgroundscene")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .offset(x: 0, y: 0)
            VStack(spacing: 10) {
                HStack() {
                    Image("How to play title") 
                        .resizable()
                        .scaledToFit()
                        .frame(width: 474, height: 116)
                        .offset(x: 20, y: 0)
                }.offset(x: 0, y: 0)
                
                VStack(spacing:10) {
                    VStack(spacing:10) {
                        Text("Needed")
                            .font(.system(size: 24))
                            .bold()
                        Text("Two players; checkers board with pieces")
                            .font(.system(size: 24))
                    }
                    VStack(spacing:10) {
                        Text("Setup")
                            .padding(.top, 20)
                            .font(.system(size: 24))
                            .bold()
                        Text("The board is positioned with the light colored square in the bottom right corner. The checkers for each player are")
                            .font(.system(size: 24))
                        Text("setup on the dark colored squares. Players should have 12 checkers in their first three rows (four in each row).")
                            .font(.system(size: 24))
                    }
                    VStack(spacing:10) {
                        Text("Objective")
                            .padding(.top, 20)
                            .font(.system(size: 24))
                            .bold()
                        Text("A single checker can move forward diagonally one space per turn.")
                            .font(.system(size: 24))
                        Text("To capture an opponent’s checker, a player may jump over a diagonally adjacent opponent's checker.")
                            .font(.system(size: 24))
                        Text("The space on the other side of the opponent’s checker must be open.")
                            .padding(.top, 10)
                            .font(.system(size: 24))
                        Text("Multiple checkers can be captured if jumped consecutively with the same checker.")
                            .font(.system(size: 24))
                        Text("If a checker makes it to the other side of the board, it is kinged. To king a checker, another checker is placed on top of it. ")
                            .padding(.top, 10)
                            .font(.system(size: 24))
                        Text("A kinged checker can move forward or backward on the board.")
                            .font(.system(size: 24))
                        Text("The first player to capture all the opponent’s checkers wins. If a player is unable to make a move, he/she loses the game.")
                            .padding(.top, 10)
                            .font(.system(size: 24))
                    }
                    VStack(spacing:10) {
                        Text("Rules")
                            .padding(.top, 20)
                            .font(.system(size: 24))
                            .bold()
                        Text("A single checker can only move and jump going forward.")
                            .font(.system(size: 24))
                        Text("If a player can make a capture, he/she has to make the capture.")
                            .font(.system(size: 24))
                    }
                    VStack {
                        Button(action: {
                            menu = true;
                        }, label: {
                            Image("backtomenu")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height:70)
                        }).fullScreenCover(isPresented: $menu, content:{MainMenu(menu: $menu)})
                    }
                    .offset(x:0, y:60)
                }
            }
        }.frame(width: .infinity, height: .infinity, alignment: .center)
    }
}

struct HowToPlay_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlay(htp: .constant(true), MainScreen: .constant(false) , present: .constant(.howtoplay))
    }
}

