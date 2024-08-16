//
//  ContentView.swift
//  memorize
//
//  Created by Dzmitry Paplauski on 2.08.24.
//

import SwiftUI
import UIKit

struct ContentView: View {
    let emojis = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"]
    @State
    var cardCount = 1

    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            controls
        }
        .padding()
    }

    private var cards: some View {
        LazyVGrid.init(
            columns: [GridItem(.adaptive(minimum: 120))]
        ) {
            ForEach(0 ..< cardCount, id: \.self) {
                let index = $0 % emojis.count
                CardView(content: emojis[index])
                    .aspectRatio(2 / 3, contentMode: .fit)
            }
        }
        .foregroundStyle(Color.orange)
    }

    private var controls: some View {
        HStack {
            cardCountAdjusterButton(by: -1, systemSymbolName: "rectangle.stack.badge.minus.fill")
            Spacer()
            cardCountAdjusterButton(by: 1, systemSymbolName: "rectangle.stack.badge.plus.fill")
        }
        .imageScale(.large)
        .font(.largeTitle)
    }

    private func cardCountAdjusterButton(
        by offset: Int,
        systemSymbolName: String
    ) -> some View {
        Button(
            action: { cardCount += offset },
            label: { Image(systemName: systemSymbolName)}
        )
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
}

#Preview {
    ContentView()
}

struct CardView: View {
    let content: String
    @State
    var isFaceUp = false

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 12)

            Group {
                shape
                    .fill(.white)
                    .strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 0.0 : 1.0)
            shape.fill()
                .opacity(isFaceUp ? 1.0 : 0.0)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}
