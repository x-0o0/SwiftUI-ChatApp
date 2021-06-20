//
//  ChannelView.swift
//  ChatSwiftUI
//
//  Created by Jaesung Lee on 2021/06/20.
//

import SwiftUI
import SendBirdSDK

struct ChannelView: View {
    @ObservedObject private var groupChannelState: GroupChannelState
    
    var body: some View {
        VStack {
            MessageList()
                .padding(.horizontal)

            MessageInputField()
                .padding()
        }
        .environmentObject(groupChannelState)
    }
    
    init(channel: SBDGroupChannel) {
        let channelState = GroupChannelState(channel: channel)
        self.groupChannelState = channelState
    }
}

struct ChannelView_Previews: PreviewProvider {
    struct Preview: View {
        var body: some View {
            ChannelView(channel: SBDGroupChannel.previewModel)
        }
    }
    
    static var previews: some View {
        Preview()
            .previewLayout(.sizeThatFits)
    }
}
