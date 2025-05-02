//
//  ContentView.swift
//  Memorize
//
//  Created by Brett Hamilton on 5/1/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            let emojis: [String] = ["👻", "🎃", "🕷️", "😈"]
            CardView(content: emojis[0], isFaceUp: false)
            CardView(content: emojis[1])
            CardView(content: emojis[2])
            CardView(content: emojis[3])
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
