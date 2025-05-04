//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Brett Hamilton on 5/3/25.
//

import SwiftUI

class EmojiMemoryGame {
    private static let emojis = ["🏀", "🏀", "🏈", "🏈", "🥎", "🥎", "⚾️", "⚾️", "🏐", "🏐", "⚽️", "⚽️"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    private var model = createMemoryGame()
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
}
