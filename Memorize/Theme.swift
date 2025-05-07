//
//  Theme.swift
//  Memorize
//
//  Created by Brett Hamilton on 5/6/25.
//

import Foundation

struct Theme {
    let name: String
    let emojis: [String]
    let pairsCount: Int
    let color: String
    
    static let themes: [Theme] = { [
        Theme(name: "sports",
              emojis: ["🏀", "🏈", "🏉", "🎳", "🥎", "🏓", "🏸", "🥊", "🏐", "🏒", "⚽️", "🥍"],
              pairsCount: 10,
              color: "green"),
        Theme(name: "vehicles",
              emojis: ["🚗", "🚙", "🏎️", "🚕", "✈️", "🚒", "🚂", "🛻", "🏍️", "🚤", "🚌", "🚑"],
              pairsCount: 12,
              color: "yellow"),
        Theme(name: "fruit",
              emojis: ["🍒", "🍓", "🍇", "🍎", "🍉", "🍑", "🍊", "🍋", "🍍", "🍌", "🥝", "🥥"],
              pairsCount: 8,
              color: "blue"),
        Theme(name: "halloween",
              emojis: ["😱", "🕷️", "🕸️", "🧙‍♀️", "😈", "🍭", "🎃", "👻", "💀", "🧟‍♂️", "🧛‍♀️", "👹"],
              pairsCount: 10,
              color: "orange"),
        Theme(name: "animals",
              emojis: ["🐈", "🐶", "🐿️", "🦝", "🐻", "🦬", "🦔", "🐎", "🦊", "🫎", "🐄", "🐨"],
              pairsCount: 7,
              color: "cyan"),
        Theme(name: "weather",
              emojis: ["☁️", "☀️", "🌤️", "🌥️", "🌧️", "🌨️", "⛈️", "🌪️", "🌬️", "🌈", "⚡️", "☔️"],
              pairsCount: 11,
              color: "purple")
    ] }()
}
