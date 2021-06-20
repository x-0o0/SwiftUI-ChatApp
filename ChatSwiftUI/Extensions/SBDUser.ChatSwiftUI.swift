//
//  SBDUser.ChatSwiftUI.swift
//  ChatSwiftUI
//
//  Created by Jaesung Lee on 2021/06/20.
//

import SendBirdSDK

extension SBDUser {
    static var previewModel: SBDUser {
        SBDUser(dictionary: [
            "user_id": UUID.init(),
            "nickname": "Joah",
            "name": "Joah",
            "profile_url": "https://avatars.githubusercontent.com/u/68183707?s=200&v=4",
        ])
    }
}
