//
//  ContentView.swift
//  memorize
//
//  Created by Dzmitry Paplauski on 2.08.24.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        HStack {
            CardView()
            CardView(isFaceUp:  false)
        }
        .foregroundStyle(Color.orange)
        .padding()
    }
}

#Preview {
    ContentView()
}

struct CardView: View {
    var isFaceUp = true

    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("👻")
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        }
    }
}
