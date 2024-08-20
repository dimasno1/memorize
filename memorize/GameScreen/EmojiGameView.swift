//
//  EmojiGameView.swift
//  memorize
//
//  Created by Dzmitry Paplauski on 2.08.24.
//

import SwiftUI
import UIKit

struct EmojiGameView: View {
    @ObservedObject
    var viewModel: EmojiGameViewModel

    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }

    private var cards: some View {
        LazyVGrid.init(
            columns: [GridItem(.adaptive(minimum: 85), spacing: 0)],
            spacing: 0
        ) {
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2 / 3, contentMode: .fit)
                    .padding(4.0)
            }
        }
        .foregroundStyle(Color.orange)
    }
}

#Preview {
    EmojiGameView(viewModel: EmojiGameViewModel())
}

struct CardView: View {
    let card: MemorizeGame<String>.Card

    init(_ card: MemorizeGame<String>.Card) {
        self.card = card
    }

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 12)

            Group {
                shape
                    .fill(.white)
                    .strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1.0, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 0.0 : 1.0)
            shape.fill()
                .opacity(card.isFaceUp ? 1.0 : 0.0)
        }
    }
}
