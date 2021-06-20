//
//  MessageList.swift
//  ChatSwiftUI
//
//  Created by Jaesung Lee on 2021/06/20.
//

import SwiftUI
import SendBirdSDK

struct MessageList: View {
    @EnvironmentObject private var groupChannelState: GroupChannelState
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack {
                // Align to the bottom
                Spacer()
                
                // Draw bubbles
                ForEach(groupChannelState.messageList, id: \.self.messageId) {
                    MessageRow(message: $0)
                }
            }
            .rotationEffect(Angle(degrees: 180))
        }
        .rotationEffect(Angle(degrees: 180))
    }
}

struct MessageList_Previews: PreviewProvider {
    struct Preview: View {
        var body: some View {
            MessageList()
        }
    }
    
    static var previews: some View {
        Preview()
            .previewLayout(.sizeThatFits)
    }
}
