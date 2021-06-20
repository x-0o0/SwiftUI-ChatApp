//
//  ChatSwiftUIApp.swift
//  ChatSwiftUI
//
//  Created by Jaesung Lee on 2021/06/20.
//

import SwiftUI

let appID = "9880C4C1-E6C8-46E8-A8F1-D5890D598C08"

@main
struct ChatSwiftUIApp: App {
    @StateObject private var chatState = SendbirdChatState(appID: appID)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(chatState)
        }
    }
}
