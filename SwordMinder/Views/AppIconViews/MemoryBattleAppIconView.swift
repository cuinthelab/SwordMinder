//
//  WordSearchAppIconView.swift
//  SwordMinder
//
//  Created by John Delano on 12/3/22.
//

import SwiftUI

struct MemoryBattleAppIconView: View {
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            ZStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.cyan)
                Text("Memory Battle")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
            }
            .aspectRatio(1, contentMode: .fit)
        }
    }
}

struct MemoryBattleAppIconView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryBattleAppIconView(action: { })
    }
}
