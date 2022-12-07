//
//  StartScreenView.swift
//  MemoryBattle
//
//  Created by Braden Nunley on 11/14/22.
//

import SwiftUI



struct StartScreenView: View {
    // gameStatus will be used to store if the user has died to display a game over message.
    // Depending on time, I may add a game over/ win screen later
    private var gameOver: Bool?
    
    
    var body: some View {
        ZStack{
            Text("🌲").font(.system(size: 400))
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
    }.background(.gray)
    }
    
    var title: some View{
            VStack{
                Text("Memory Battle").font(.system(size: 60)).multilineTextAlignment(.center)
            }.padding()
        }
    
    var mainScreen: some View {
        HStack{
            Button(action: {
                //currentApp = .swordMinder
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
        HStack{
            Button(action: {
                // This will bring up the instructions
            }, label:{
                VStack {
                    Image(systemName: "info.circle").foregroundColor(Color.black).font(.largeTitle)
                    Text("Instructions")
                        .font(.footnote)
                        .foregroundColor(Color.black)
                }.padding(.horizontal)
            })
        }
    }
    
    var start: some View {
        HStack{
            Button(action: {
                //MemoryBattleView()
            }, label:{
                
                    Text("Start the Battle!")
                        .font(.system(size: 40))
            })
        }
    }
    
}



struct StartScreenView_Previews: PreviewProvider {
    static var previews: some View {
        StartScreenView()
    }
}
