//
//  User.swift
//  Chat
//
//  Created by Matthew Houston on 5/4/23.
//

import Foundation
import FirebaseFirestoreSwift


struct User: Identifiable, Decodable {
    @DocumentID var id: String? //for identifiable //firebase has one coming back from snapshot
    let email: String
    let fullname: String
    let profileImageUrl: String?
    let username: String
}

let MOCK_USER = User(id: "123456", email: "Test", fullname: "test", profileImageUrl: "test", username: "test")
