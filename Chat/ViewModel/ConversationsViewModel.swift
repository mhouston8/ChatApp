//
//  ConversationsViewModel.swift
//  Chat
//
//  Created by Matthew Houston on 5/22/23.
//

import Foundation
import SwiftUI
import Firebase


class ConversationsViewModel: ObservableObject {
    
    @Published var recentMessages = [Message]()
    
    init() {
        fetchRecentMessages()
    }
    
    func fetchRecentMessages() {
        guard let uid = AuthenticationViewModel.shared.userSession?.uid else { return }
        
        let query = COLLECTION_MESSAGES.document(uid).collection("recent-messages").order(by: "timestamp", descending: true) //descending = most recent at top
        query.getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            self.recentMessages = documents.compactMap({try? $0.data(as: Message.self)})
        }
        
//        query.addSnapshotListener { snapshot, error in
//            guard let documents = snapshot?.documents else {
//                print("Error fetching documents: \(error!)")
//                return
//            }
//        }
    }
}
