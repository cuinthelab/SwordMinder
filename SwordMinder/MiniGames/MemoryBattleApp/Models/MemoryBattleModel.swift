//
//  MemoryBattleModel.swift
//  SwordMinder
//
//  Created by Braden Nunley on 12/7/22.
//

import Foundation
import SwiftUI

struct VerseText {
    var fullVerse: String
    @State var textWithBlanks: String
    
    init() {
        // This will be where the app gets a random verse
        fullVerse = "and they said, \"Believe in the Lord Jesus, and you wil be saved, you and your household\""
    }
    
    func blankedOutWords() {
        
        
        //This will blank out words
        let words = fullVerse.components(separatedBy: " ")
        var blankedOutWords = words
        var numWords = words.count / 3
        
        // Make random places to take out words
        let indices = Set(0..<words.count).shuffled().prefix(numWords)
        
        //Blank out the words
        for index in indices {
            blankedOutWords[index] = "__"
        }
        
        //add
        textWithBlanks = ""
        for word in blankedOutWords {
            textWithBlanks += word + " "
        }
        textWithBlanks.removeLast()
    }
    
}


