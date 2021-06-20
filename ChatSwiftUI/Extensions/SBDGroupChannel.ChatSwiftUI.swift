//
//  SBDGroupChannel.ChatSwiftUI.swift
//  ChatSwiftUI
//
//  Created by Jaesung Lee on 2021/06/20.
//

import SendBirdSDK

extension SBDGroupChannel {
    static var previewModel: SBDGroupChannel {
        SBDGroupChannel(
            dictionary: [
                "name": "Joah Ell",
                "cover_url": "https://avatars.githubusercontent.com/u/68183707?s=200&v=4",
                "created_at": Int64(1624199446),
                "unread_message_count": UInt(87)
            ]
        )
    }
    func unreadMessageCountToString() -> String {
        switch self.unreadMessageCount {
            case 0: return ""
            case 1...99: return String(self.unreadMessageCount)
            case 100...: return "99+"
            default: return ""
        }
    }
    
    func lastUpdatedAtToDate() -> Date {
        var lastUpatedAt = Date(timeIntervalSince1970: TimeInterval(self.createdAt))
        
        if let lastMessage = self.lastMessage {
            lastUpatedAt = Date(timeIntervalSince1970: TimeInterval(lastMessage.createdAt / 1000))
        }
        
        return lastUpatedAt
    }
}
