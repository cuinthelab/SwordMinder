//
//  ContentView.swift
//  MemoryBattle
//
//  Created by Braden Nunley on 11/14/22.
//


//swordminder.bible.wordsfor
//

import SwiftUI

struct MemoryBattleView: View {
    @ObservedObject var memoryBattle: MemoryBattleViewModel
    @EnvironmentObject var swordMinder: SwordMinder
    @State private var userInput: String = ""
    @State private var textWithBlanks = ""
    
    var passage: Passage
    
    
    var player: String?
    @State var timeRemaining = 1000
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        
        VStack {
            Spacer()
            title
                .padding()
            Spacer()
            gameBody
            
            verseBody
            
            HStack{
                Spacer()
                time
            }
        }.background(PageConstants.backgroundColor)
            .ignoresSafeArea(edges: [.top, .leading, .trailing])
    }
    
    
    var title: some View{
        VStack{
            Text("Memory Battle").font(.system(size: PageConstants.titleFont)).multilineTextAlignment(.center)
        }.padding()
    }
    
    var gameBody: some View{
        ZStack{
            VStack{
                HStack{
                    
                    VStack{
                        Text("Health")
                            .font(.title2)
                        Text("30")
                            .font(.title2)
                        Spacer()
                        
                        //The simulated player
                        Image(systemName: "figure.arms.open").font(.system(size: 100))
                        
                    }
                    Spacer()
                    
                    VStack{
                        Text("Health")
                            .font(.title2)
                        Text("13")
                            .font(.title2)
                        Spacer()
                        Text("🐓").font(.system(size: 80))
                    }
                }
                //potions
            }.padding()
        }.frame(width: PageConstants.gameBodyWidth, height: PageConstants.gameBodyHeight).background(PageConstants.gameBodyColor)
    }
    
    var verseBody: some View{
        ZStack{
            verse

        }.frame(width: PageConstants.verseWidth, height: PageConstants.verseHeight).background(PageConstants.verseBodyColor)
    }
    
    @ViewBuilder
    var verse: some View{
        VStack{
            Text((memoryBattle.model.verseReference)).padding()
            Spacer()
            
            if memoryBattle.gameState == .fullText {
                Text(memoryBattle.model.fullVerse).padding(.horizontal)
                Spacer()
                // Button to get rid of random words
                Button(action: {
                    memoryBattle.updateGameState()
                }) {
                    Text("Ready to Attack!")
                        .foregroundColor(Color.black)
                        .padding()
                }
            } else if memoryBattle.gameState == .missingWords {
                Text(memoryBattle.model.textWithBlanks)
                    .foregroundColor(.black)
                
                Spacer()
                // text field
                TextField("Enter in the missing words", text: $userInput).background(.white)
                    .padding()
                
                // Button to submit answers
                Button(action: {
                    memoryBattle.updateGameState()
                    //Text(textWithBlanks)
                    memoryBattle.verseCheck(userInput: userInput)
                }) {
                    Text("Submit Answers")
                }
            }
            

//                Text(swordMinder.bible.words(for: passage))
        }
    }
    
    //Potions view not used
    var potions: some View{
        VStack{
            HStack{
                Text("Potions")
                    .foregroundColor(Color.black).padding(.horizontal)
                Spacer()
            }
            HStack{
                Button("🧃") {
                    // This will be an item that might heal or buff the player in some way
                }.font(.system(size: 50))
                
                Button("🥛") {
                    // This will be an item that might heal or buff the player in some way
                }.font(.system(size: 50))
                
                Button("☕️") {
                    // This will be an item that might heal or buff the player in some way
                }.font(.system(size: 50))
            }
        }.frame(width: PageConstants.verseWidth, height: PageConstants.potionsHeight).background(.brown)
    }
    
//Timer view
    var time: some View{

        VStack{
            Text("\(timeRemaining)")
                .font(.title)
                .onReceive(timer) { _ in
                    if timeRemaining > 0 { timeRemaining -= 1
                    }
                }
            Text("Seconds")
        }.padding()
    }
    
    private struct PageConstants {
        static let titleFont: CGFloat = 40
        static let verseWidth: CGFloat = 400
        static let verseHeight: CGFloat = 250
        static let gameBodyWidth: CGFloat = 400
        static let gameBodyHeight: CGFloat = 350
        static let potionsHeight: CGFloat = 75
        static let backgroundColor: Color = .white
        static let gameBodyColor: Color = .green
        static let verseBodyColor: Color = .brown
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryBattleView(memoryBattle: MemoryBattleViewModel(model: MemoryBattleModel()), passage: Passage())
    }
}



