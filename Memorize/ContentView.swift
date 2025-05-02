//
//  ContentView.swift
//  Memorize
//
//  Created by Brett Hamilton on 5/1/25.
//

import SwiftUI

struct ContentView: View {
    let sportsEmojis: [String]      = ["🏀", "🏀", "🏈", "🏈", "🥎", "🥎", "⚾️", "⚾️", "🏐", "🏐", "⚽️", "⚽️"]
    let carEmojis: [String]         = ["🚗", "🚗", "🚙", "🚙", "🛻", "🛻", "🏎️", "🏎️", "🚕", "🚕", "🚓", "🚓"]
    let fruitEmojis: [String]       = ["🍒", "🍒", "🍓", "🍓", "🍎", "🍎", "🍑", "🍑", "🍌", "🍌", "🫐", "🫐"]
    let weatherEmojis: [String]     = ["☀️", "☀️", "⛅️", "⛅️", "🌧️", "🌧️", "❄️", "❄️", "⛈️", "⛈️", "🌬️", "🌬️"]
    
    @State var cardCount: Int = 12
    @State var selectedTheme: [String] = Array(repeating: "❓", count: 12)   // Default to question mark emojis on app start, until theme is chosen
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                cards
            }
            themePickers
        }
        .padding()
    }
    
    var themePickers: some View {
        HStack {
            sportsTheme
            Spacer()
            carTheme
            Spacer()
            fruitTheme
            Spacer()
            weatherTheme
        }
        .font(.title3)
    }
    
    var sportsTheme: some View {
        pickTheme(sportsEmojis, name: "Sports", symbol: "figure.basketball")
    }
    
    var carTheme: some View {
        pickTheme(carEmojis, name: "Cars", symbol: "car.fill")
    }
    
    var fruitTheme: some View {
        pickTheme(fruitEmojis, name: "Fruit", symbol: "fork.knife")
    }
    
    var weatherTheme: some View {
        pickTheme(weatherEmojis, name: "Weather", symbol: "sun.max.fill")
    }
            
    func pickTheme(_ theme: [String], name: String, symbol: String) -> some View {
        Button(action: {
            selectedTheme = theme
            selectedTheme.shuffle()
        }, label: {
            VStack {
                Image(systemName: symbol)
                Text(name)
            }
        })
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: selectedTheme[index])
                    .aspectRatio(2/3, contentMode: .fit)
                
            }
        }
        .foregroundColor(.red)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    
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
