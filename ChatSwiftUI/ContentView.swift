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
        ChannelList()
            .popover(isPresented: $chatState.signInRequired) {
                SignInView()
            }
            .refreshable {
                chatState.fetchChannelList()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    struct Preview: View {
        @StateObject private var chatState = SendbirdChatState(appID: appID)
        
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
