//
//  MemoryBattleViewModel.swift
//  SwordMinder
//
//  Created by Braden Nunley on 12/7/22.
//

import Foundation


class MemoryBattleViewModel: ObservableObject {
    var model: VerseText
    var gameState: GameState
    var playerHealth: Int
    
    init(model: VerseText) {
        self.model = model
        self.gameState = .fullText
        self.playerHealth = 30
    }
    
    func updateGameState() {
        if gameState == .fullText{
            gameState = .missingWords
        } else {
            gameState = .fullText
        }
    }
    
    func playerHealth(userUnput: String) {
        
    }
 
    
}

