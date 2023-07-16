//
//  ConversationCellViewModel.swift
//  Chat
//
//  Created by Matthew Houston on 5/23/23.
//

import Foundation

class ConversationCellViewModel: ObservableObject {
    @Published var message: Message
    
    init(message: Message) {
        self.message = message
        fetchUser()
    }
    
    var chatPartnerID: String {
        return message.fromId == AuthenticationViewModel.shared.userSession?.uid ? message.toId : message.fromId
    }
       
    var chatPartnerProfileImageUrl: URL? {
        guard let user = message.user else { return nil }
        return URL(string: self.message.user?.profileImageUrl ?? "")
    }
    
    var fullName: String {
        guard let user = message.user else { return ""}
        return user.fullname
    }
    
    func fetchUser() {
        COLLECTION_USERS.document(chatPartnerID).getDocument { snapshot, error in
            self.message.user = try? snapshot?.data(as: User.self)
        }
        
    }
    
}
