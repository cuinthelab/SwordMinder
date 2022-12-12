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
    
    var passage: Passage
    
    
    //var player: String?
    @State var timeRemaining = 120
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var sampleVerse: String = "and they said, \"Believe in the Lord Jesus, and you wil be saved, you and your household\""
    var sampleReference: String = "Acts 16:31"
    
    
    var body: some View {
        VStack {
            Spacer()
            title
            Spacer()
            gameBody
            
            verseBody
            
            HStack{
                Spacer()
                time
            }
        }.background(.gray)
            .ignoresSafeArea(edges: [.top, .leading, .trailing])
        //MemoryBattleViewModel.words = swordMinder.bible.words(for: passage)
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
                        //This health will be handled by the model/viewmodel later
                        Text("30")
                            .font(.title2)
                        Spacer()
                        
                        //The simulated player
                        Image(systemName: "figure.arms.open").font(.system(size: 100))
                        
                    }
                    Spacer()
                    
                    //The simulated first enemy
                    //Since there will be multiple enemies, I will use the model/viewModel to have different enemies appear
                    VStack{
                        Text("Health")
                            .font(.title2)
                        //This health will be handled by the model/viewmodel later
                        Text("13")
                            .font(.title2)
                        Spacer()
                        Text("🐓").font(.system(size: 80))
                    }
                }
                //potions
            }.padding()
        }.frame(width: PageConstants.gameBodyWidth, height: PageConstants.gameBodyHeight).background(.cyan)
    }
    
    var verseBody: some View{
        ZStack{
            verse
            //            VStack{
            //                VStack{
            //                    Text(sampleReference).padding()
            //
            //                    Text(sampleVerse)
            //                        .multilineTextAlignment(.center).padding()
            //                }
            //                ZStack{
            //                    Button(action: {
            //                        // This will be make the card dissapear and reappear with blanks missing from the verse after a couple seconds
            //                    }, label:{
            //                        Text("ATTACK!")
            //                            .font(.headline)
            //                            .fontWeight(.bold)
            //                            .foregroundColor(Color.black)
            //                    })
            //                }.background(.red)
            //            }
        }.frame(width: PageConstants.verseWidth, height: PageConstants.verseHeight).background(.green)
    }
    
    @ViewBuilder
    var verse: some View{
       
        
        if memoryBattle.gameState == .fullText {
            Text(memoryBattle.model.fullVerse)
        } else {
            Text(memoryBattle.model.textWithBlanks)
        }
        
        // Button to reveal words
        Button(action: {
            self.memoryBattle.updateGameState()
            
        }) {
        Text("Show Missing Words")
    }
        
        // text field
        TextField("Enter in the missing words", text: $userInput)
        
        // Button to submit answers
        Button(action: {
            self.memoryBattle.playerHealth(userInput: self.userInput)
        }) {
               Text("Submit Answers")
        }
               
        
        
        VStack{
            Text((passage.referenceFormatted))
//            Text(swordMinder.bible.words(for: passage))
        }
    }
    
//    MemoryBattleViewModel.words = swordMinder.bible.words(for: passage)
    
    
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
    
    var time: some View{
        // The timer will be updated in the model/viewmodel to work for the various actions needed
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
        static let gameBodyHeight: CGFloat = 400
        static let potionsHeight: CGFloat = 75
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryBattleView(memoryBattle: <#MemoryBattleViewModel#>, passage: Passage())
    }
}



