//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Brett Hamilton on 5/3/25.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: [Card]
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
