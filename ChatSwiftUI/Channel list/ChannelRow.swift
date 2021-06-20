//
//  ChannelRow.swift
//  ChatSwiftUI
//
//  Created by Jaesung Lee on 2021/06/20.
//

import SwiftUI
import SendBirdSDK

struct ChannelRow: View {
    let channel: SBDGroupChannel
    
    var body: some View {
        HStack {
            if let coverURL = channel.coverUrl {
                AsyncImage(url: URL(string: coverURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 64, height: 64)
                        .clipShape(Circle())
                } placeholder: {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 64, height: 64)
                    
                }
                .padding(16)
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Text(channel.name)
                        .bold()
                    
                    unreadCountView

                    Spacer()
                    
                    notificationView
                }
                
                HStack {
                    Text(channel.lastMessage?.message ?? "No message")
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                    
                    Text(channel.lastUpdatedAtToDate(), style: .date)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                }
                .font(.caption)
            }
        }
    }
    
    var unreadCountView: some View {
        Text(channel.unreadMessageCountToString())
            .foregroundColor(.white)
            .lineLimit(1)
            .padding(3)
            .background(Circle().foregroundColor(.red))
            .opacity(channel.unreadMessageCount == 0 ? 0.0 : 1.0)
    }
    
    var notificationView: some View {
        Image(systemName: "bell.slash")
            .foregroundColor(.red)
            .opacity(channel.myPushTriggerOption != .off ? 0.0 : 1.0)
            .padding(16)
    }
}

struct ChannelList_Previews: PreviewProvider {
    static var model: SBDGroupChannel = {
        let channel = SBDGroupChannel.previewModel
        channel.setMyPushTriggerOption(.off, completionHandler: nil)
        return channel
    }()
    
    static var previews: some View {
        ChannelRow(channel: model)
            .previewLayout(.sizeThatFits)
    }
}

