//
//  MessageInputField.swift
//  ChatSwiftUI
//
//  Created by Jaesung Lee on 2021/06/20.
//

import SwiftUI

struct MessageInputField: View {
    @EnvironmentObject private var groupChannelState: GroupChannelState
    
    var body: some View {
        HStack {
            textField
            
            sendButton
        }
    }
    
    var textField: some View {
        TextField("abc...", text: $groupChannelState.text)
            .padding(.vertical, 7)
            .padding(.horizontal, 14)
            .multilineTextAlignment(.leading)
            .lineLimit(3)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.init(UIColor.secondarySystemBackground))
            )
    }
    
    var sendButton: some View {
        Button(action: groupChannelState.send) {
            Image(systemName: "paperplane")
                .foregroundColor(.white)
                .padding(.vertical, 7)
                .padding(.horizontal, 14)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.blue)
                )
        }
    }
}

import SendBirdSDK

struct MessageInputField_Previews: PreviewProvider {
    struct Preview: View {
        @StateObject private var groupChannelState = GroupChannelState(channel: SBDGroupChannel.previewModel)
        
        var body: some View {
            MessageInputField()
                .environmentObject(groupChannelState)
        }
    }
    static var previews: some View {
        Preview()
            .previewLayout(.sizeThatFits)
    }
}
