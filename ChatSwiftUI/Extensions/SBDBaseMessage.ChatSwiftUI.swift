//
//  SBDBaseMessage.swift
//  ChatSwiftUI
//
//  Created by Jaesung Lee on 2021/06/20.
//

import Combine
import SendBirdSDK

extension SBDBaseMessage {
    static var previewModel: SBDBaseMessage {
        let message = SBDBaseMessage(dictionary: [
            "request_id": UUID().uuidString,
            "message_id": UUID().uuidString,
            "message": "Hihihi",
        ])
        message.sender = SBDSender(dictionary: [
            "user_id": UUID.init(),
            "nickname": "Joah",
            "name": "Joah",
            "profile_url": "https://avatars.githubusercontent.com/u/68183707?s=200&v=4",
        ])
        return message
    }
}

