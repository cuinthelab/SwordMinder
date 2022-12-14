//
//  MemoryBattleViewModel.swift
//  SwordMinder
//
//  Created by Braden Nunley on 12/7/22.
//

import Foundation


class MemoryBattleViewModel: ObservableObject {
    var model: MemoryBattleModel
    var gameState: GameState
    
    init(model: MemoryBattleModel) {
        self.model = model
        self.gameState = .fullText
    }
    
    func updateGameState() {
        if gameState == .fullText{
            gameState = .missingWords
            model.blankedOutWords()
        } else if gameState == .missingWords{
            gameState = .fullText
        }
    }
    
    
    func verseCheck(userInput: String) {
        model.checkEnteredWords()
    }
 
    
}

