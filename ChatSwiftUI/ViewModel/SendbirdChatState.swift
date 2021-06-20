//
//  SendbirdChatState.swift
//  ChatSwiftUI
//
//  Created by Jaesung Lee on 2021/06/20.
//

import Combine
import SendBirdSDK
import SendbirdChat

class SendbirdChatState: ObservableObject {
    @Published var signInRequired: Bool = true
    @Published var error: String?
    
    var currentUser: SBDUser? { SendbirdChat.currentUser }
    
    private var subscribers = Set<AnyCancellable>()
    
    init(appID: String) {
        SendbirdChat.initialize(with: appID)
    }
    
    func signIn(with userID: String, accessToken: String) {
        SendbirdChat
            .connectionPulisher(userID: userID, accessToken: accessToken.isEmpty ? nil : accessToken)
            .sink { result in
                switch result {
                case .finished:
                    print("\(#function) finished")
                case .failure(let error):
                    self.error = error.localizedDescription
                    print("\(#function) failed with error: \(error.localizedDescription)")
                }
            } receiveValue: { user in
                self.signInRequired = false
            }
            .store(in: &subscribers)
    }
    
    func signOut() {
        SendbirdChat
            .disconnectionPublisher()
            .sink { self.signInRequired = true }
            .store(in: &subscribers)
    }
}
