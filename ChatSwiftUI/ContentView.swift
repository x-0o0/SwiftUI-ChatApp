//
//  ContentView.swift
//  ChatSwiftUI
//
//  Created by Jaesung Lee on 2021/06/20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var chatState: SendbirdChatState
    var body: some View {
        Text("Hello, world!")
            .padding()
            .popover(isPresented: $chatState.signInRequired) {
                SignInView()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    struct Preview: View {
        @StateObject private var chatState = SendbirdChatState(appID: "")
        
        var body: some View {
            ContentView()
                .environmentObject(chatState)
        }
    }
    static var previews: some View {
        Preview()
            .previewLayout(.sizeThatFits)
    }
}
