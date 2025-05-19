//
//  ContentView.swift
//  Memorize
//
//  Created by Brett Hamilton on 5/1/25.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3
    
    var body: some View {
        VStack {
            Text("Score: \(viewModel.score)")
            Text("Theme: \(viewModel.themeName.capitalized)").font(.subheadline)
            ScrollView {
                cards
            }
            buttons
        }
        .padding()
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, itemCount: viewModel.cardCount, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(4)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 3)) {
                        viewModel.choose(card)
                    }
                }
        }
        .foregroundColor(viewModel.cardColor)
    }
    
    var buttons: some View {
        HStack {
            Button("Shuffle") {
                withAnimation {
                    viewModel.shuffle()
                }
            }
            Spacer()
            Button("New Game") {
                viewModel.restart()
            }
        }
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
