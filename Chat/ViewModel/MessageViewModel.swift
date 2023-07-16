//
//  MessageViewModel.swift
//  Chat
//
//  Created by Matthew Houston on 5/20/23.
//

import Foundation


struct MessageViewModel {
    
    let message: Message
    
    init(message: Message) {
        self.message = message
    }
    
    var currentUid: String {
        return AuthenticationViewModel.shared.userSession?.uid ?? ""
    }
    
    var isFromCurrentUser: Bool {
        message.fromId == currentUid
    }
    
    var profileImageUrl: URL? {
        guard let profileImageUrl = message.user?.profileImageUrl else { return nil }
        return URL(string: profileImageUrl)
    }
    
}
