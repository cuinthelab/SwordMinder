//
//  Instructions.swift
//  MemoryBattle
//
//  Created by Braden Nunley on 11/14/22.
//

import SwiftUI

struct MemoryBattleInstructionsView: View {
    var body: some View {
        VStack{
            Spacer()
            Text("Instructions").font(.system(size: 60)).padding()
            Text("You goal is to defeat the enemies! You have a set amount of time to memorize the verse that appears. Press Attack when ready, and the verse will reappear with some words blanked out. You must enter in the correct words to attack the enemy.")
                .multilineTextAlignment(.leading)
            Text("You have a few potions at your disposal to help with the fight so use them wisely!")
                .multilineTextAlignment(.leading)
            Text("Be careful not to die! :)")
                .multilineTextAlignment(.leading)
            Spacer()

        }.padding().background(.white)
            .ignoresSafeArea(edges: [.top, .leading, .trailing])
        
    }
}

struct MemoryBattleInstructions_Previews: PreviewProvider {
    static var previews: some View {
        MemoryBattleInstructionsView()
    }
}
