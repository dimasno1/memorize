//
//  MemorizeGame.swift
//  memorize
//
//  Created by Dzmitry Paplauski on 19.08.24.
//

import Foundation

struct MemorizeGame<CardContent> {
    typealias ContentCreator = (Int) -> CardContent

    private(set) var cards: [Card]

    init(
        pairsNumber: Int,
        cardContentFactory: ContentCreator
    ) {
        self.cards = (0 ..< pairsNumber).flatMap { index in
            let content = cardContentFactory(index)

            return [
                Card(isFaceUp: false, isMatched: false, content: content),
                Card(isFaceUp: false, isMatched: false, content: content)
            ]
        }
    }

    func choose(_ card: Card) {
    }

    mutating func shuffle() {
        cards.shuffle()
    }
}

extension MemorizeGame {
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool

        let content: CardContent
    }
}
