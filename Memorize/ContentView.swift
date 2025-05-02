//
//  ContentView.swift
//  Memorize
//
//  Created by Brett Hamilton on 5/1/25.
//

import SwiftUI

struct ContentView: View {
    let halloweenEmojis: [String]   = ["👻", "👻", "🕷️", "🕷️", "🎃", "🎃", "🧙‍♀️", "🧙‍♀️", "😱", "😱", "🍭", "🍭"]
    let carEmojis: [String]         = ["🚗", "🚗", "🚙", "🚙", "🛻", "🛻", "🏎️", "🏎️", "🚕", "🚕", "🚓", "🚓"]
    let fruitEmojis: [String]       = ["🍒", "🍒", "🍓", "🍓", "🍎", "🍎", "🍑", "🍑", "🍌", "🍌", "🫐", "🫐"]
    let weatherEmojis: [String]     = ["☀️", "☀️", "⛅️", "⛅️", "🌧️", "🌧️", "❄️", "❄️", "⛈️", "⛈️", "🌬️", "🌬️"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                cards
            }
            
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: carEmojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
            
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
