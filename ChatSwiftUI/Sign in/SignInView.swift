//
//  SignInView.swift
//  ChatSwiftUI
//
//  Created by Jaesung Lee on 2021/06/20.
//

import SwiftUI

struct SignInView: View {
    enum Field: Hashable {
        case userIDField
        case accessTokenField
    }
    
    @EnvironmentObject private var chatState: SendbirdChatState
    @State private var userID = ""
    @State private var accessToken = ""
    
    @FocusState private var focusedField: Field?
    
    var body: some View  {
        VStack {
            TextField("Enter user ID", text: $userID)
                .focused($focusedField, equals: .userIDField)
            
            Divider()
                .padding(.bottom)
            
            SecureField("Enter access token", text: $accessToken)
                .focused($focusedField, equals: .accessTokenField)
            
            Divider()
                .padding(.bottom)
            
            Text(chatState.error ?? "")
                .font(.caption)
                .foregroundColor(.red)
            
            Button("Sign In") {
                if userID.isEmpty {
                    focusedField = .userIDField
                }
//                else if accessToken.isEmpty {
//                    focusedField = .accessTokenField
//                }
                else {
                    chatState.signIn(
                        with: userID,
                        accessToken: accessToken
                    )
                }
            }
        }
        .padding()
    }
}

struct SignInView_Previews: PreviewProvider {
    struct Preview: View {
        @StateObject private var chatState = SendbirdChatState(appID: appID)
        
        var body: some View {
            SignInView()
                .environmentObject(chatState)
        }
    }
    static var previews: some View {
        Preview()
    }
}
