//
//  GroupChannelState.swift
//  ChatSwiftUI
//
//  Created by Jaesung Lee on 2021/06/20.
//

import Combine
import SwiftUI
import SendBirdSDK

class GroupChannelState: ObservableObject {
    @Published var text: String = ""
    @Published var messageList: [SBDUserMessage] = []
    
    let channel: SBDGroupChannel
    
    init(channel: SBDGroupChannel) {
        self.channel = channel
        
        retrievePreviousMessage()
    }
    
    func retrievePreviousMessage() {
        
    }
    
    func send() {
        guard !text.isEmpty else { return }
        // MARK: - Send message
        guard let params = SBDUserMessageParams(message: text) else { return }
        channel.sendUserMessage(with: params) { [self] (sentMessage, error) in
            guard let message = sentMessage else { return }
            // Update message list
            withAnimation { [self] in
                messageList.append(message)
            }
        }
        self.text = ""
    }
}

