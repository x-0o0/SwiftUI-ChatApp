//
//  MessageRow.swift
//  ChatSwiftUI
//
//  Created by Jaesung Lee on 2021/06/20.
//

import SwiftUI
import SendBirdSDK

struct MessageRow: View {
    let message: SBDBaseMessage
    
    var body: some View {
        HStack(alignment: .bottom) {
            profileView
                .clipShape(Circle())
                
            VStack(alignment: .leading) {
                Text(message.sender?.nickname ?? "Unknown user")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.leading)
                
                messageBubble
            }
            
            Spacer()
        }
    }
    
    var profileView: some View {
        Group {
            if let profileURL = message.sender?.profileUrl {
                AsyncImage(url: URL(string: profileURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 32, height: 32)
                } placeholder: {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 32, height: 32)
                        .foregroundColor(.secondary)
                }
            }
            else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 32, height: 32)
                    .foregroundColor(.secondary)
            }
        }
    }
    
    var messageBubble: some View {
        Text(message.message)
            .padding(.vertical, 7)
            .padding(.horizontal, 14)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.secondary, lineWidth: 1.0)
            )
    }
}

struct MessageRow_Previews: PreviewProvider {
    static var previews: some View {
        MessageRow(message: SBDBaseMessage.previewModel)
            .previewLayout(.sizeThatFits)
    }
}
