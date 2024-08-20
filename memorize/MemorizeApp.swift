//
//  memorizeApp.swift
//  memorize
//
//  Created by Dzmitry Paplauski on 2.08.24.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject
    private var game = EmojiGameViewModel()

    var body: some Scene {
        WindowGroup {
            EmojiGameView(viewModel: game)
        }
    }
}
