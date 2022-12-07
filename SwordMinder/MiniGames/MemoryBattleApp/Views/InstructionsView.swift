//
//  Instructions.swift
//  MemoryBattle
//
//  Created by Braden Nunley on 11/14/22.
//

import SwiftUI

struct InstructionsView: View {
    var body: some View {
        VStack{
            Text("Instructions").font(.system(size: 60)).padding()
            Text("You goal is to defeat the enemies! You have a set amount of time to memorize the verse that appears. Press Attack when ready, and the verse will reappear with some words blanked out. You must enter in the correct words to attack the enemy.")
                .multilineTextAlignment(.center)
            Text("You have a few potions at your disposal to help with the fight so use them wisely!")
                .multilineTextAlignment(.center)
            Text("There will be multiple enemies so be careful not to die! :)")
                .multilineTextAlignment(.center)
            Spacer()
            HStack{
                back
                Spacer()
            }
        }.padding().frame(width: 400, height: 600).background(.gray)
        
    }
    
    var back: some View {
        HStack{
            Button(action: {
                // This will be the action to go back to the start screen
            }, label:{
                VStack {
                    Image(systemName: "arrowshape.left.fill").foregroundColor(Color.black).font(.largeTitle)
                    Text("Back")
                        .font(.footnote)
                        .foregroundColor(Color.black)
                }.padding(.horizontal)
            })
            
        }
    }
}

struct Instructions_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsView()
    }
}
