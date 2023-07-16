//
//  ChatViewModel.swift
//  Chat
//
//  Created by Matthew Houston on 3/29/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


class ChatViewModel: ObservableObject {

    @Published var messages = [Message]()
    let user: User
    
    init(user: User) {
        self.user = user
        self.fetchMessages()
    }
    
    func sendMessage(_ messageText: String) {
        guard let currentUserUid = AuthenticationViewModel.shared.userSession?.uid else { return }
        guard let chatPartnerUid = user.id else { return }
        
        //going to populate this document.
        let currentUserReference = COLLECTION_MESSAGES.document(currentUserUid).collection(chatPartnerUid).document()
        
        
        //don't create a different document for the chat partner id because we want the message id to be the same.
        let chatPartnerReference = COLLECTION_MESSAGES.document(chatPartnerUid).collection(currentUserUid)
        
        let currentUserRecentMessagesRef = COLLECTION_MESSAGES.document(currentUserUid).collection("recent-messages").document(chatPartnerUid)
        let chatPartnerRecentMessagesRef = COLLECTION_MESSAGES.document(chatPartnerUid).collection("recent-messages").document(currentUserUid)
        
        let messageID = currentUserReference.documentID
        
        let data: [String:Any] = ["text":messageText, "fromId":currentUserUid, "toId": chatPartnerUid, "read": false, "timestamp": Timestamp(date: Date())]
        
        currentUserReference.setData(data)
        
        //create the message with the same user id on the chat partner side.
        chatPartnerReference.document(messageID).setData(data)
        
        //update recent message table for user and chatpartner
        currentUserRecentMessagesRef.setData(data)
        chatPartnerRecentMessagesRef.setData(data)
        
    }
    
    func fetchMessages() {
        guard let currentUserId = AuthenticationViewModel.shared.userSession?.uid else { return }
        guard let chatPartnerId = user.id else { return }
        
        let query = COLLECTION_MESSAGES
            .document(currentUserId)
            .collection(chatPartnerId)
            .order(by: "timestamp", descending: false) //sort messages by timestamp
        
        
        //add real-time chat capabilities with a listener that's listening for changes on the backend
        query.addSnapshotListener { snapshot, error in
            guard let changes = snapshot?.documentChanges.filter({$0.type == .added}) else { return }
            var messages = changes.compactMap({try? $0.document.data(as: Message.self)})
            
            for (index, message) in messages.enumerated() where message.fromId != currentUserId {
                messages[index].user = self.user
            }
            
            //updates the published property
            self.messages.append(contentsOf: messages) //contentsOf add onto array with array
            print("List of all messages: \(self.messages)")
        }
        
        //NOT REAL TIME
//        query.getDocuments { snapshot, error in
//            if let error = error {
//                print("There was an error fetching the current user's messages. Reason:  \(error.localizedDescription)")
//                return
//            }
//            guard let documents = snapshot?.documents else { return }
//            //map the documents into the messages array.
//            //compact map is for when there is a possibilty one of the items can be nil.
//            //map is for when there are no nil items.
//            var messages = documents.compactMap({try? $0.data(as: Message.self)})
//            for (index, message) in messages.enumerated() where message.fromId != currentUserId {
//                messages[index].user = self.user
//            }
//
//            //updates the published property
//            self.messages = messages
//            print("List of all messages: \(self.messages)")
//        }
    }
    
}
