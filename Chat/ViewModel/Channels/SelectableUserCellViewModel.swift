//
//  SelectableUserCellViewModel.swift
//  Chat
//
//  Created by Matthew Houston on 5/30/23.
//

import Foundation

struct SelectableUserCellViewModel {
    let selectableUser: SelectableUser
    
    var profileImageURL: URL? {
        return URL(string: selectableUser.user.profileImageUrl ?? "")
    }
    
    var username: String {
        return selectableUser.user.username
    }
    
    var fullName: String {
        return selectableUser.user.fullname
    }
    
    var selectedImageName: String {
        return selectableUser.isSelected ? "checkmark.circle.fill" : "circle"
    }
    
}
