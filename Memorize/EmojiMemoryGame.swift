//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Brett Hamilton on 5/3/25.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    private static func createMemoryGame(with theme: Theme?) -> MemoryGame<String> {
        var emojis: [String] = []
        
        emojis = theme!.emojis.shuffled()
        
        return MemoryGame(numberOfPairsOfCards: theme!.pairsCount) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame(with: Theme.themes.randomElement())
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func restart() {
        model = EmojiMemoryGame.createMemoryGame(with: Theme.themes.randomElement())
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
}
