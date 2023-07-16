//
//  SelectableUser.swift
//  Chat
//
//  Created by Matthew Houston on 5/29/23.
//

import Foundation


struct SelectableUser: Identifiable {
    let user: User
    var isSelected: Bool = false
    var id: String {
        return user.id ?? UUID().uuidString
    }
}
