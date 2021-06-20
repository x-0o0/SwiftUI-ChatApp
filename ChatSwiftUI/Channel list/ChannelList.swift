//
//  ChannelList.swift
//  ChatSwiftUI
//
//  Created by Jaesung Lee on 2021/06/20.
//

import SwiftUI

struct ChannelList: View {
    @EnvironmentObject private var chatState: SendbirdChatState
    
    var body: some View {
        NavigationView {
            List(chatState.channelList, id: \.self) { channel in
                NavigationLink {
                    ChannelView(channel: channel)
                } label: {
                    ChannelRow(channel: channel)
                }
            }
        }
    }
}

