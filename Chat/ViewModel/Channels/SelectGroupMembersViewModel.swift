//
//  SelectGroupMembersViewModel.swift
//  Chat
//
//  Created by Matthew Houston on 5/29/23.
//

import Foundation
import Firebase


class SelectGroupMembersViewModel: ObservableObject {
    
    @Published var selectableUsers = [SelectableUser]()
    @Published var selectedUsers = [SelectableUser]()

    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, error in
            if let error = error {
                print("error fetching all users. Reason: \(error)")
            }
            
            //map snapshot to users object
            guard let documents = snapshot?.documents else { return }
            
            let users = documents.compactMap({
                try? $0.data(as: User.self)
            }).filter({$0.id != AuthenticationViewModel.shared.userSession?.uid}) //filter out current user from collection
            
            //create selectableusers from users array
            self.selectableUsers = users.map({SelectableUser(user: $0)})
            
            print("DEBUG: List of all users = \(self.selectableUsers)")
        }
    }
    
    func selectUser(user: SelectableUser, isSelected: Bool) {
        //first find the user in array collection
        guard let index = self.selectableUsers.firstIndex(where: { $0.id == user.id }) else { return }
        
        //modify the selectable user in the array at the selected index.
        selectableUsers[index].isSelected = isSelected
        
        if isSelected {
            self.selectedUsers.append(selectableUsers[index])
        } else {
            self.selectedUsers.removeAll(where: {$0.id == user.id })
        }
    }
}
