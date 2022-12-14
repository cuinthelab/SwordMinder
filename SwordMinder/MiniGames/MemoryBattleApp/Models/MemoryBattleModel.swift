//
//  MemoryBattleModel.swift
//  SwordMinder
//
//  Created by Braden Nunley on 12/7/22.
//

import Foundation
import SwiftUI

struct MemoryBattleModel {
    var fullVerse: String
    var verseReference: String
    var playerHealth: Int
    var enemyHealth: Int
    @State var textWithBlanks: String = ""
    
    init() {
        // This will be where the app gets a random verse
        fullVerse = "and they said, \"Believe in the Lord Jesus, and you wil be saved, you and your household\""
        verseReference = "Acts 16:31"
        
        //MemoryBattleViewModel.words = swordMinder.bible.words(for: passage)
        
        self.playerHealth = 30
        self.enemyHealth = 17
    }
    
    func blankedOutWords() {

        //This will blank out words
        let words = fullVerse.components(separatedBy: " ")
        var blankedOutWords = words
        let numWords = words.count / 3
        
        // Make random places to take out words
        let indices = Set(0..<words.count).shuffled().prefix(numWords)
        
        //Blank out the words
        for index in indices {
            blankedOutWords[index] = "___"
        }
        
        //add
        textWithBlanks = ""
        for word in blankedOutWords {
            textWithBlanks += word + " "
        }
        textWithBlanks.removeLast()
    }
    
    func checkEnteredWords() {
        
    }
    
}


