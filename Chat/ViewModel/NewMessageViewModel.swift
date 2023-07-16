//
//  NewMessageViewModel.swift
//  Chat
//
//  Created by Matthew Houston on 5/15/23.
//

import Foundation
import Firebase


class NewMessageViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init() {
        self.fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, error in
            if let error = error {
                print("error fetching all users. Reason: \(error)")
            }
            
            //map snapshot to users object
            guard let documents = snapshot?.documents else { return }
            
            self.users = documents.compactMap({
                try? $0.data(as: User.self)
            }).filter({$0.id != AuthenticationViewModel.shared.userSession?.uid}) //filter out current user from collection
            
            print("DEBUG: List of all users = \(self.users)")
        }
    }
    
    
}
