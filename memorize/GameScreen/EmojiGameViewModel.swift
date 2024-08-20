//
//  EmojiGameViewModel.swift
//  memorize
//
//  Created by Dzmitry Paplauski on 19.08.24.
//

import SwiftUI

final class EmojiGameViewModel: ObservableObject {
    typealias Game = MemorizeGame<String>

    var cards: [Game.Card] {
        game.cards
    }

    @Published
    private var game = createGame()

    private static let emojis = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"]

    private static func createGame() -> Game {
        Game(pairsNumber: 10) { pairIndex in
            guard emojis.indices.contains(pairIndex) else {
                return "🙊"
            }
            return emojis[pairIndex]
        }
    }

    // MARK: Interaction
    func choose(_ card: Game.Card) {
        game.choose(card)
    }

    func shuffle() {
        game.shuffle()
    }
}
