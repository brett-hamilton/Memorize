//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Brett Hamilton on 5/3/25.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card

    private static func createMemoryGame(with theme: Theme?) -> MemoryGame<String> {
        var emojis: [String] = []
        
        emojis = theme!.emojis.shuffled()
        
        return MemoryGame(numberOfPairsOfCards: theme!.pairsCount) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    private static var currentTheme: Theme = Theme.themes.randomElement()!
    @Published private var model = createMemoryGame(with: currentTheme)
    
    var cards: [Card] {
        model.cards
    }
    
    var score: Int {
        model.score
    }
    
    var cardColor: Color {
        switch EmojiMemoryGame.currentTheme.color {
        case "blue": return .blue
        case "yellow": return .yellow
        case "green": return .green
        case "orange": return .orange
        case "cyan": return .cyan
        case "purple": return .purple
        default: return .gray
        }
    }
    
    var themeName: String {
        EmojiMemoryGame.currentTheme.name
    }
    
    var cardCount: Int {
        EmojiMemoryGame.currentTheme.pairsCount * 2
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func restart() {
        EmojiMemoryGame.currentTheme = Theme.themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(with: EmojiMemoryGame.currentTheme)
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
}
