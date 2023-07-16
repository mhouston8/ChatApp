//
//  Message.swift
//  Chat
//
//  Created by Matthew Houston on 3/29/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestore


//Identifiable protocol for SwiftUI foreach loop. makes this model identifiable

struct Message: Identifiable, Decodable, Equatable {
    static func == (lhs: Message, rhs: Message) -> Bool {
        return true
    }
    
    @DocumentID var id: String?
    let fromId: String
    let toId: String
    let read: Bool
    let text: String
    let timestamp: Timestamp
    
    var user: User? //set this is in code
}
