/* Project: Checker Game for MacOS
 Project for WWDC 2023
 Author: Khang Nguyen Huynh
 Finished on April 15th, 2023
 MainMenu file
 */

// Library imported
import SwiftUI
import AVFoundation

struct MainMenu: View {
    @Binding var menu:Bool
    @State private var MainScreen = false
    @State private var computermode = false
    @State private var htp = false
    @State private var present: gamemode = .pvp
    @State private var moveLength: Double = 50
    @State private var transparent: Double = 1
   
    var body: some View {
        ZStack {
            Image("startingScene")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .offset(x: 0, y: 0)
                
            VStack(spacing: 71){
                HStack() {
                    Image("icon") 
                        .resizable()
                        .scaledToFit()
                        .frame(width: 114.29, height: 114.29)
                    Image("checkers") 
                        .resizable()
                        .scaledToFit()
                        .frame(width: 474, height: 116)
                        .offset(x: 20, y: 0)
                }.offset(x: -30, y: 130)
            
                VStack(spacing: 71){
                    Button(action: {
                        MainScreen = true;
                        present = .pvp
                    }, label: {
                        Image("VS PLAYER")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 260, height: 90)
                    }) .fullScreenCover(isPresented: $MainScreen, content:{VsPlayer(MainScreen: $MainScreen, present: $present)})
                    
                    Button(action: { 
                        computermode = true;
                        present = .pve
                    }, label: {
                        Image("VS COMPUTER")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 260, height: 90)
                    }).fullScreenCover(isPresented: $computermode, content:{home(computermode: $computermode, present: $present)})
                    
                    Button(action: {
                        htp = true;
                        present = .howtoplay
                    }, label: {
                        Image("How to play")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 260, height: 90)
                    }).fullScreenCover(isPresented: $htp, content:{HowToPlay(htp: $htp, MainScreen: $MainScreen, present: $present)})
                }.offset(x: 0, y: 130)
            }.offset(x: -520, y: -120)
        }
        .frame(width: .infinity, height: .infinity, alignment: .center)
    }
}

struct MainMenuview: PreviewProvider {
    static var previews: some View {
        MainMenu(menu: .constant(true))
    }
}
