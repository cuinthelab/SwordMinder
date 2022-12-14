//
//  StartScreenView.swift
//  MemoryBattle
//
//  Created by Braden Nunley on 11/14/22.
//

import SwiftUI

struct MemoryBattleStartScreenView: View {
        @ObservedObject var memoryBattle: MemoryBattleViewModel
        @EnvironmentObject var swordMinder: SwordMinder
        @Binding var currentApp: Apps
    
    
    
    // gameStatus will be used to store if the user has died to display a game over message.
    // Depending on time, I may add a game over/ win screen later
    var gameOver: Bool?
    
    
    var body: some View {
        NavigationView{
            ZStack{
                Text("🗡").font(.system(size: 350))
                VStack {
                    title
                    if gameOver == true{
                        Text("Game Over").font(.system(size: 60)).foregroundColor(Color.red)
                    } else if gameOver == false{
                        Text("You Win!").font(.system(size: 60)).foregroundColor(Color.green)
                    }
                    Spacer()
                    
                    start
                    
                    HStack{
                        mainScreen
                        Spacer()
                        instructions
                    }
                }
            }.background(.white)
        }
    }
    var title: some View{
            VStack{
                Text("Memory Battle").font(.system(size: 60)).multilineTextAlignment(.center)
            }.padding()
        }
    
    var mainScreen: some View {
        HStack{
            Button(action: {
                currentApp = .swordMinder
            }, label:{
                VStack {
                    Image(systemName: "arrowshape.left.fill").foregroundColor(Color.black).font(.largeTitle)
                    Text("Home")
                        .font(.footnote)
                        .foregroundColor(Color.black)
                }.padding(.horizontal)
            })
            
        }
    }
    
    var instructions: some View {
        
        NavigationLink(destination: MemoryBattleInstructionsView()) {
            VStack {
                Image(systemName: "info.circle").foregroundColor(Color.black).font(.largeTitle)
                Text("Instructions")
                    .font(.footnote)
                    .foregroundColor(Color.black)
            }.padding(.horizontal)
                }
    }
    
    var start: some View {
        NavigationLink(destination: MemoryBattleView(memoryBattle: MemoryBattleViewModel(model: MemoryBattleModel()), passage: Passage())) {
            VStack {
                Text("Start the Battle!")
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
            }.padding()
                }
    }
    
}



struct MemoryBattleStartScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryBattleStartScreenView(memoryBattle: MemoryBattleViewModel(model: MemoryBattleModel()), currentApp: .constant(.memoryBattleApp))
            .environmentObject(SwordMinder())
    }
}
