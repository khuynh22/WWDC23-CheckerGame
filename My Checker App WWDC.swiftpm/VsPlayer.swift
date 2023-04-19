/* Project: Checker Game for MacOS
 Project for WWDC 2023
 Author: Khang Nguyen Huynh
 Finished on April 15th, 2023
 VsPlayer file (main file)
 */
import SwiftUI
import AVFoundation

struct VsPlayer: View {
    enum turns {
        case orange, black
    }
    @Binding var MainScreen:Bool
    @Binding var present:gamemode
    @State var feature:[[Features]] = Array(repeating: Array(repeating: Features(), count: 8), count: 8)
    @State var turn:turns = .black
    @State var heal = [coordinate]()
    @State var enemy = [coordinate]()
    @State var exchanges = coordinate(x: 0, y: 0)
    @State var eat = [coordinate]()
    @State var search: Bool = false
    @State var numberRed: Int = 12
    @State var numberBlack: Int = 12
    @State var win: String = ""
    
    var body: some View {
        ZStack{
            Image("Backgroundscene")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .offset(x: 0, y: 0)
            
            VStack {
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
                }.offset(x: 0, y: 30)
                
                VStack{
                    
                    ZStack {
                        VStack(alignment: .center, spacing: 0.0) {
                            ForEach(0..<8) { i in
                                HStack(spacing: 0.0) {
                                    ForEach(0..<8) { j in
                                        Rectangle()
                                            .frame(width: 120, height: 120)
                                            .foregroundColor(MapColor(i: i, j: j))
                                    }
                                }
                            }
                        }
                        ZStack {
                            VStack(alignment: .center) {
                                ForEach(0..<8) { i in
                                    HStack {
                                        ForEach(0..<8) { j in
                                            Circle()
                                                .stroke(ColorChoice(x: i, y: j),lineWidth:8)
                                                .frame(width: 111.8, height: 111.8)
                                                .opacity(OpaChoice(x: i, y: j))
                                        }
                                    }
                                }
                            }
                            VStack(alignment: .center) {
                                ForEach(0..<8) { i in
                                    HStack {
                                        ForEach(0..<8) { j in
                                            Circle()
                                                .frame(width: 111.8, height: 111.8)
                                                .foregroundColor(feature[i][j].color)
                                                .overlay(
                                                    Image(feature[i][j].imageName)
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: 120, height: 120)
                                                        .offset(x: -5, y: 5)
                                                )
                                                .opacity(feature[i][j].transparent)
                                                .onTapGesture {
                                                    CheckSelect(i: i, j: j)
                                                }
                                        }
                                    }
                                }
                            }
                            VStack(alignment: .center) {
                                ForEach(0..<8) { i in
                                    HStack {
                                        ForEach(0..<8) { j in
                                            Image("crown")
                                                .resizable()
                                                .padding(.all, 13.0)
                                                .scaledToFill()
                                                .frame(width: 111.8, height: 111.8)
                                                .opacity(king(i: i, j: j))
                                                .onTapGesture {
                                                    CheckSelect(i: i, j: j)
                                                }
                                        }
                                    }
                                }
                            }
                            VStack{
                                if win != ""{
                                    if win == "P2 Win"{
                                        Button {
                                            MainScreen = false
                                        } label: {
                                            Image("Blackwins")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 200, height: 100)
                                        }
                                    }
                                    else{
                                        Button {
                                            MainScreen = false
                                        } label: {
                                            Image("Redwins")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 200, height: 100)
                                        }
                                    }
                                }
                                
                            }
                        }
                        
                    }.offset(x:0, y: 50)
                    
                    HStack (spacing: 120) {
                        Button(action: {MainScreen = false}, label: {
                            Image("backtomenu")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height:70)
                        })
                        Button {
                            EarlyStart()
                        } label: {
                            Image("startthegame")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height:70)
                        }
                    }
                    .padding(60)
                }
                
            }
        }
    }
    
    func MapColor(i:Int, j:Int)->Color{
        if i % 2 == 0{
            if j % 2 == 0 {
                return Color(red: 161/255, green: 180/255, blue: 195/255)
            } else { 
                return Color(red: 248/255, green: 252/255, blue: 255/255)
            }
        } else{
            if j % 2 == 0 {
                return Color(red: 248/255, green: 252/255, blue: 255/255)
            } else {
                return Color(red: 161/255, green: 180/255, blue: 195/255)
            }
        }
    }
    
    func EarlyStart() {
        feature = Array(repeating: Array(repeating: Features(), count: 8), count: 8)
        turn = .black
        heal = [coordinate]()
        enemy = [coordinate]()
        exchanges = coordinate(x: 0, y: 0)
        eat = [coordinate]()
        search = false
        numberRed = 12
        numberBlack = 12
        win = ""
        for i in 0...7{
            for j in 0...7{
                if i < 3{
                    if i % 2 == 0{
                        if j % 2 == 0{
                            feature[i][j].color = Color.orange
                            feature[i][j].imageName = "redchecker"
                            feature[i][j].transparent = 1
                        }
                    }
                    else{
                        if j % 2 == 1{
                            feature[i][j].color = Color.orange
                            feature[i][j].imageName = "redchecker"
                            feature[i][j].transparent = 1
                        }
                    }
                }
                else if i > 4{
                    if i % 2 == 0{
                        if j % 2 == 0{
                            feature[i][j].color = Color.black
                            feature[i][j].imageName = "blackchecker"
                            feature[i][j].transparent = 1
                        }
                    }
                    else{
                        if j % 2 == 1{
                            feature[i][j].color = Color.black
                            feature[i][j].imageName = "blackchecker"
                            feature[i][j].transparent = 1
                        }
                    }
                }
            }
        }
    }
    
    // function to decide color of the checker
    func ColorChoice(x:Int, y:Int) -> Color{
        if feature[x][y].choose == true{
            return Color.red
        }
        else{
            return feature[x][y].color
        }
    }
    func OpaChoice(x:Int, y:Int) -> Double{
        if feature[x][y].choose == true{
            return 1
        }
        else{
            return 0
        }
    }
    func PouncedPosition(){
        for he in heal{
            if feature[he.x][he.y].transparent == 0.3{
                feature[he.x][he.y].transparent = 0
                feature[he.x][he.y].color = Color.red
            }
        }
        heal = [coordinate]()
    }
    func PouncedPosition(i:Int, j:Int, turncolor:Color, enemycolor: Color, imageType: String, oppImageType: String){
        if feature[i][j].color == Color.orange {
            if feature[i][j].mark == false {
                if i + 2 < 8 && j - 2 >= 0 && feature[i+1][j-1].color == enemycolor && feature[i+2][j-2].transparent == 0{
                    feature[i+2][j-2].color = turncolor
                    feature[i+2][j-2].imageName = imageType
                    feature[i+2][j-2].transparent = 0.3
                    enemy.append(coordinate(x: i+2, y: j-2))
                }
                if i + 2 < 8 && j + 2 < 8 && feature[i+1][j+1].color == enemycolor && feature[i+2][j+2].transparent == 0{
                    feature[i+2][j+2].color = turncolor
                    feature[i+2][j+2].imageName = imageType
                    feature[i+2][j+2].transparent = 0.3
                    enemy.append(coordinate(x: i+2, y: j+2))
                }
            } else{
                if i - 2 >= 0 && j - 2 >= 0 && feature[i-1][j-1].color == enemycolor && feature[i-2][j-2].transparent == 0{
                    feature[i-2][j-2].color = turncolor
                    feature[i-2][j-2].imageName = imageType
                    feature[i-2][j-2].transparent = 0.3
                    enemy.append(coordinate(x: i-2, y: j-2))
                }
                if i - 2 >= 0 && j + 2 < 8 && feature[i-1][j+1].color == enemycolor && feature[i-2][j+2].transparent == 0{
                    feature[i-2][j+2].color = turncolor
                    feature[i-2][j+2].imageName = imageType
                    feature[i-2][j+2].transparent = 0.3
                    enemy.append(coordinate(x: i-2, y: j+2))
                }
                if i + 2 < 8 && j - 2 >= 0 && feature[i+1][j-1].color == enemycolor && feature[i+2][j-2].transparent == 0{
                    feature[i+2][j-2].color = turncolor
                    feature[i+2][j-2].imageName = imageType
                    feature[i+2][j-2].transparent = 0.3
                    enemy.append(coordinate(x: i+2, y: j-2))
                }
                if i + 2 < 8 && j + 2 < 8 && feature[i+1][j+1].color == enemycolor && feature[i+2][j+2].transparent == 0{
                    feature[i+2][j+2].color = turncolor
                    feature[i+2][j+2].imageName = imageType
                    feature[i+2][j+2].transparent = 0.3
                    enemy.append(coordinate(x: i+2, y: j+2))
                }
            }
        } else if feature[i][j].color == Color.black{
            if feature[i][j].mark == false{
                if i - 2 >= 0 && j - 2 >= 0 && feature[i-1][j-1].color == enemycolor && feature[i-2][j-2].transparent == 0{
                    feature[i-2][j-2].color = turncolor
                    feature[i-2][j-2].imageName = imageType
                    feature[i-2][j-2].transparent = 0.3
                    enemy.append(coordinate(x: i-2, y: j-2))
                }
                if i - 2 >= 0 && j + 2 < 8 && feature[i-1][j+1].color == enemycolor && feature[i-2][j+2].transparent == 0{
                    feature[i-2][j+2].color = turncolor
                    feature[i-2][j+2].imageName = imageType
                    feature[i-2][j+2].transparent = 0.3
                    enemy.append(coordinate(x: i-2, y: j+2))
                }
            } else{
                if i - 2 >= 0 && j - 2 >= 0 && feature[i-1][j-1].color == enemycolor && feature[i-2][j-2].transparent == 0{
                    feature[i-2][j-2].color = turncolor
                    feature[i-2][j-2].imageName = imageType
                    feature[i-2][j-2].transparent = 0.3
                    enemy.append(coordinate(x: i-2, y: j-2))
                }
                if i - 2 >= 0 && j + 2 < 8 && feature[i-1][j+1].color == enemycolor && feature[i-2][j+2].transparent == 0{
                    feature[i-2][j+2].color = turncolor
                    feature[i-2][j+2].imageName = imageType
                    feature[i-2][j+2].transparent = 0.3
                    enemy.append(coordinate(x: i-2, y: j+2))
                }
                if i + 2 < 8 && j - 2 >= 0 && feature[i+1][j-1].color == enemycolor && feature[i+2][j-2].transparent == 0{
                    feature[i+2][j-2].color = turncolor
                    feature[i+2][j-2].imageName = imageType
                    feature[i+2][j-2].transparent = 0.3
                    enemy.append(coordinate(x: i+2, y: j-2))
                }
                if i + 2 < 8 && j + 2 < 8 && feature[i+1][j+1].color == enemycolor && feature[i+2][j+2].transparent == 0{
                    feature[i+2][j+2].color = turncolor
                    feature[i+2][j+2].imageName = imageType
                    feature[i+2][j+2].transparent = 0.3
                    enemy.append(coordinate(x: i+2, y: j+2))
                }
            }
        }
    }
    
    func highlight(){
        for e in enemy{
            feature[e.x][e.y].transparent = 0
            feature[e.x][e.y].color = Color.red
        }
        enemy = [coordinate]()
    }
    func ChooseOrNotChoose(x:Int, y:Int){
        for i in 0...7{
            for j in 0...7{
                if i == x && j == y{
                    feature[i][j].choose = true
                }
                else{
                    feature[i][j].choose = false
                }
            }
        }
    }
    
    func NotEat(){
        eat = [coordinate]()
    }
    
    func CheckEat(mycolor:Color, opcolor:Color){
        for i in 0...7{
            for j in 0...7{
                if mycolor == Color.orange && feature[i][j].color == mycolor{
                    var tmp_index = 0
                    if feature[i][j].mark == false{
                        if i + 2 < 8 && j - 2 >= 0 && feature[i+1][j-1].color == opcolor && feature[i+1][j-1].transparent == 1 && feature[i+2][j-2].transparent == 0{
                            tmp_index = 1
                        }
                        if i + 2 < 8 && j + 2 < 8 && feature[i+1][j+1].color == opcolor && feature[i+1][j+1].transparent == 1 && feature[i+2][j+2].transparent == 0{
                            tmp_index = 1
                        }
                        if tmp_index == 1{
                            eat.append(coordinate(x: i, y: j))
                        }
                    } else{
                        if i + 2 < 8 && j - 2 >= 0 && feature[i+1][j-1].color == opcolor && feature[i+1][j-1].transparent == 1  && feature[i+2][j-2].transparent == 0{
                            tmp_index = 1
                        }
                        if i + 2 < 8 && j + 2 < 8 && feature[i+1][j+1].color == opcolor && feature[i+1][j+1].transparent == 1  && feature[i+2][j+2].transparent == 0{
                            tmp_index = 1
                        }
                        if i - 2 >= 0 && j - 2 >= 0 && feature[i-1][j-1].color == opcolor && feature[i-1][j-1].transparent == 1  && feature[i-2][j-2].transparent == 0{
                            tmp_index = 1
                        }
                        if i - 2 >= 0 && j + 2 < 8 && feature[i-1][j+1].color == opcolor && feature[i-1][j+1].transparent == 1  && feature[i-2][j+2].transparent == 0{
                            tmp_index = 1
                        }
                        if tmp_index == 1{
                            eat.append(coordinate(x: i, y: j))
                        }
                    }
                } else if mycolor == Color.black && feature[i][j].color == mycolor{
                    var tmp_index = 0
                    if feature[i][j].mark == false {
                        if i - 2 >= 0 && j - 2 >= 0 && feature[i-1][j-1].color == opcolor && feature[i-1][j-1].transparent == 1  && feature[i-2][j-2].transparent == 0{
                            tmp_index = 1
                        }
                        if i - 2 >= 0 && j + 2 < 8 && feature[i-1][j+1].color == opcolor && feature[i-1][j+1].transparent == 1  && feature[i-2][j+2].transparent == 0{
                            tmp_index = 1
                        }
                        if tmp_index == 1{
                            eat.append(coordinate(x: i, y: j))
                        }
                    } else {
                        if i + 2 < 8 && j - 2 >= 0 && feature[i+1][j-1].color == opcolor && feature[i+1][j-1].transparent == 1  && feature[i+2][j-2].transparent == 0{
                            tmp_index = 1
                        }
                        if i + 2 < 8 && j + 2 < 8 && feature[i+1][j+1].color == opcolor && feature[i+1][j+1].transparent == 1  && feature[i+2][j+2].transparent == 0{
                            tmp_index = 1
                        }
                        if i - 2 >= 0 && j - 2 >= 0 && feature[i-1][j-1].color == opcolor && feature[i-1][j-1].transparent == 1  && feature[i-2][j-2].transparent == 0{
                            tmp_index = 1
                        }
                        if i - 2 >= 0 && j + 2 < 8 && feature[i-1][j+1].color == opcolor && feature[i-1][j+1].transparent == 1  && feature[i-2][j+2].transparent == 0{
                            tmp_index = 1
                        }
                        if tmp_index == 1{
                            eat.append(coordinate(x: i, y: j))
                        }
                    }
                }
            }
        }
    }
    
    func PlayerColor(color:Color)->turns{
        if color == Color.orange{
            return .orange
        }
        else{
            return .black
        }
    }
    
    func GameWin(){
        if numberBlack == 0{
            win = "P2 Win"
        }
        if numberRed == 0{
            win = "P1 Win"
        }
    }
    
    func CheckMovement(color:Color)->Bool{
        for i in 0...7{
            for j in 0...7{
                if color == Color.orange {
                    if feature[i][j].mark == false{
                        if i + 1 < 8 && (j - 1 >= 0 || j + 1 < 8){
                            if j - 1 >= 0 && feature[i + 1][j - 1].transparent == 0{
                                return true
                            }
                            if j + 1 < 8 && feature[i + 1][j + 1].transparent == 0{
                                return true
                            }
                        }
                    } else{
                        if (i + 1 < 8 || i - 1 >= 0) && (j - 1 >= 0 || j + 1 < 8 ){
                            if j - 1 >= 0 && i + 1 < 8 && feature[i + 1][j - 1].transparent == 0{
                                return true
                            }
                            if j + 1 < 8 && i + 1 < 8 && feature[i + 1][j + 1].transparent == 0{
                                return true
                            }
                            if j - 1 >= 0 && i - 1 >= 0 && feature[i - 1][j - 1].transparent == 0{
                                return true
                            }
                            if j + 1 < 8 && i - 1 >= 0 && feature[i - 1][j + 1].transparent == 0{
                                return true
                            }
                        }
                    }
                } else{
                    if feature[i][j].mark == false{
                        if i - 1 >= 0 && (j - 1 >= 0 || j + 1 < 8){
                            if j - 1 >= 0 && feature[i - 1][j - 1].transparent == 0{
                                return true
                            }
                            if j + 1 < 8 && feature[i - 1][j + 1].transparent == 0{
                                return true
                            }
                        }
                    } else{
                        if (i + 1 < 8 || i - 1 >= 0) && (j - 1 >= 0 || j + 1 < 8 ){
                            if j - 1 >= 0 && i + 1 < 8 && feature[i + 1][j - 1].transparent == 0{
                                return true
                            }
                            if j + 1 < 8 && i + 1 < 8 && feature[i + 1][j + 1].transparent == 0{
                                return true
                            }
                            if j - 1 >= 0 && i - 1 >= 0 && feature[i - 1][j - 1].transparent == 0{
                                return true
                            }
                            if j + 1 < 8 && i - 1 >= 0 && feature[i - 1][j + 1].transparent == 0{
                                return true
                            }
                        }
                    }
                }
            }
        }
        return false
    }
    
    func SolidColor(){
        for he in heal{
            if feature[he.x][he.y].transparent == 0.3{
                feature[he.x][he.y].transparent = 0
                feature[he.x][he.y].color = Color.red
            }
        }
        heal = [coordinate]()
    }
    
    func CheckSelect(i:Int, j:Int){
        var turncolor: Color
        var enemycolor: Color
        var imageType: String
        var oppImageType: String
        switch turn{
            case.orange:
            turncolor = Color.orange
                imageType = "redchecker"
            case.black:
            turncolor = Color.black
                imageType = "blackchecker"
        }
        if turncolor == Color.orange{
            enemycolor = Color.black
            oppImageType = "blackchecker"
        } else{
            enemycolor = Color.orange
            oppImageType = "redchecker"
        }
        
        if CheckMovement(color: turncolor)==false{
            if turncolor == Color.black{
                win = "Orange"
            } else{
                win = "Black"
            }
        }
        
        if eat.count != 0{
            for mu in eat{
                feature[mu.x][mu.y].choose = true
            }
            
            if feature[i][j].choose == true && feature[i][j].color == turncolor && search == false{
                ChooseOrNotChoose(x: i,y: j)
                highlight()
                exchanges = coordinate(x: i, y: j)
                PouncedPosition(i: i, j: j, turncolor: turncolor, enemycolor: enemycolor, imageType: imageType, oppImageType: oppImageType)
            } else if feature[i][j].transparent == 0.3 && feature[i][j].color == turncolor{
                highlight()
                feature[i][j].transparent = 1
                feature[i][j].color = turncolor
                feature[exchanges.x][exchanges.y].color = Color.red
                feature[exchanges.x][exchanges.y].transparent = 0
                feature[i][j].mark = feature[exchanges.x][exchanges.y].mark
                feature[exchanges.x][exchanges.y].mark = false
                feature[(exchanges.x+i)/2][(exchanges.y + j)/2].transparent = 0
                feature[(exchanges.x+i)/2][(exchanges.y + j)/2].mark = false
                if feature[(exchanges.x+i)/2][(exchanges.y + j)/2].color == Color.orange{
                    numberBlack -= 1
                } else{
                    numberRed -= 1
                }
                
                feature[(exchanges.x+i)/2][(exchanges.y + j)/2].color = Color.red
                GameWin()
                
                if feature[i][j].color==Color.orange && i==7{
                    feature[i][j].mark = true
                } else if feature[i][j].color==Color.black && i==0{
                    feature[i][j].mark = true
                }
                
                PouncedPosition(i: i, j: j, turncolor: turncolor, enemycolor: enemycolor, imageType: imageType, oppImageType: oppImageType)
                if enemy.count == 0{
                    search = false
                    ChooseOrNotChoose(x: -1, y: -1)
                    NotEat()
                    CheckEat(mycolor: enemycolor, opcolor: turncolor)
                    turn = PlayerColor(color: enemycolor)
                } else{
                    exchanges = coordinate(x: i, y: j)
                    ChooseOrNotChoose(x: i, y: j)
                    search = true
                    NotEat()
                    eat.append(coordinate(x: i, y: j))
                }
            }
        } else if feature[i][j].color == turncolor && feature[i][j].transparent == 1{
            feature[exchanges.x][exchanges.y].choose = false
            feature[i][j].choose = true
            SolidColor()
            exchanges = coordinate(x: i, y: j)
            if turncolor == Color.orange{
                if feature[i][j].mark == false{
                    if i + 1 < 8 && (j - 1 >= 0 || j + 1 < 8){
                        if j - 1 >= 0 && feature[i + 1][j - 1].transparent == 0{
                            feature[i + 1][j - 1].transparent = 0.3
                            feature[i + 1][j - 1].color = Color.orange
                            feature[i + 1][j - 1].imageName = "redchecker"
                            heal.append(coordinate(x: i + 1, y: j - 1))
                        }
                        if j + 1 < 8 && feature[i + 1][j + 1].transparent == 0{
                            feature[i + 1][j + 1].transparent = 0.3
                            feature[i + 1][j + 1].color = Color.orange
                            feature[i + 1][j + 1].imageName = "redchecker"
                            heal.append(coordinate(x: i + 1, y: j + 1))
                        }
                    }
                } else{
                    if (i + 1 < 8 || i - 1 >= 0) && (j - 1 >= 0 || j + 1 < 8 ){
                        if j - 1 >= 0 && i + 1 < 8 && feature[i + 1][j - 1].transparent == 0{
                            feature[i + 1][j - 1].transparent = 0.3
                            feature[i + 1][j - 1].color = Color.orange
                            feature[i + 1][j - 1].imageName = "redchecker"
                            heal.append(coordinate(x: i + 1, y: j - 1))
                        }
                        if j + 1 < 8 && i + 1 < 8 && feature[i + 1][j + 1].transparent == 0{
                            feature[i + 1][j + 1].transparent = 0.3
                            feature[i + 1][j + 1].color = Color.orange
                            feature[i + 1][j + 1].imageName = "redchecker"
                            heal.append(coordinate(x: i + 1, y: j + 1))
                        }
                        if j - 1 >= 0 && i - 1 >= 0 && feature[i - 1][j - 1].transparent == 0{
                            feature[i - 1][j - 1].transparent = 0.3
                            feature[i - 1][j - 1].color = Color.orange
                            feature[i - 1][j - 1].imageName = "redchecker"
                            heal.append(coordinate(x: i - 1, y: j - 1))
                        }
                        if j + 1 < 8 && i - 1 >= 0 && feature[i - 1][j + 1].transparent == 0{
                            feature[i - 1][j + 1].transparent = 0.3
                            feature[i - 1][j + 1].color = Color.orange
                            feature[i - 1][j + 1].imageName = "redchecker"
                            heal.append(coordinate(x: i - 1, y: j + 1))
                        }
                    }
                }
            } else{
                if feature[i][j].mark == false{
                    if i - 1 >= 0 && (j - 1 >= 0 || j + 1 < 8){
                        if j - 1 >= 0 && feature[i - 1][j - 1].transparent == 0{
                            feature[i - 1][j - 1].transparent = 0.3
                            feature[i - 1][j - 1].color = Color.black
                            feature[i - 1][j - 1].imageName = "blackchecker"
                            heal.append(coordinate(x: i - 1, y: j - 1))
                        }
                        if j + 1 < 8 && feature[i - 1][j + 1].transparent == 0{
                            feature[i - 1][j + 1].transparent = 0.3
                            feature[i - 1][j + 1].color = Color.black
                            feature[i - 1][j + 1].imageName = "blackchecker"
                            heal.append(coordinate(x: i - 1, y: j + 1))
                        }
                    }
                } else{
                    if (i + 1 < 8 || i - 1 >= 0) && (j - 1 >= 0 || j + 1 < 8 ){
                        if j - 1 >= 0 && i + 1 < 8 && feature[i + 1][j - 1].transparent == 0{
                            feature[i + 1][j - 1].transparent = 0.3
                            feature[i + 1][j - 1].color = Color.black
                            feature[i + 1][j - 1].imageName = "blackchecker"
                            heal.append(coordinate(x: i + 1, y: j - 1))
                        }
                        if j + 1 < 8 && i + 1 < 8 && feature[i + 1][j + 1].transparent == 0{
                            feature[i + 1][j + 1].transparent = 0.3
                            feature[i + 1][j + 1].color = Color.black
                            feature[i + 1][j + 1].imageName = "blackchecker"
                            heal.append(coordinate(x: i + 1, y: j + 1))
                        }
                        if j - 1 >= 0 && i - 1 >= 0 && feature[i - 1][j - 1].transparent == 0{
                            feature[i - 1][j - 1].transparent = 0.3
                            feature[i - 1][j - 1].color = Color.black
                            feature[i - 1][j - 1].imageName = "blackchecker"
                            heal.append(coordinate(x: i - 1, y: j - 1))
                        }
                        if j + 1 < 8 && i - 1 >= 0 && feature[i - 1][j + 1].transparent == 0{
                            feature[i - 1][j + 1].transparent = 0.3
                            feature[i - 1][j + 1].color = Color.black
                            feature[i - 1][j + 1].imageName = "blackchecker"
                            heal.append(coordinate(x: i - 1, y: j + 1))
                        }
                    }
                }
            }
        } else if feature[i][j].color == turncolor && feature[i][j].transparent == 0.3{
            feature[i][j].transparent = 1
            feature[exchanges.x][exchanges.y].color = Color.red
            feature[exchanges.x][exchanges.y].choose = false
            feature[i][j].mark = feature[exchanges.x][exchanges.y].mark
            feature[exchanges.x][exchanges.y].transparent = 0
            feature[exchanges.x][exchanges.y].mark = false
            if feature[i][j].color==Color.orange && i==7{
                feature[i][j].mark = true
            } else if feature[i][j].color==Color.black && i==0{
                feature[i][j].mark = true
            }
            SolidColor()
            turn = PlayerColor(color: enemycolor)
            NotEat()
            CheckEat(mycolor: enemycolor, opcolor: turncolor)
        }
        
        if eat.count != 0{
            for mu in eat{
                feature[mu.x][mu.y].choose = true
            }
        }
    }
    
    func king(i:Int, j:Int) -> Double{
        if feature[i][j].mark == true{
            return 1
        } else{
            return 0
        }
    }
}

struct VsPlayer_Previews: PreviewProvider {
    static var previews: some View {
        VsPlayer(MainScreen: .constant(true), present: .constant(.pvp))
    }
}
