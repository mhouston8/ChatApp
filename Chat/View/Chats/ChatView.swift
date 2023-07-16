//
//  ChatsView.swift
//  Chat
//
//  Created by Matthew Houston on 3/24/23.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    @ObservedObject var chatViewModel: ChatViewModel
    private let user: User
    
    init(user: User) {
        self.user = user
        self.chatViewModel = ChatViewModel(user: user)
    }
    
    var body: some View {
        
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(chatViewModel.messages) { message in
                            MessageView(messageViewModel: MessageViewModel(message: message))
                                .id(message == chatViewModel.messages.last ? message.id : nil)
                        }
                    }
                }
                .onAppear {
                    if let messageID = chatViewModel.messages.last?.id {
                        withAnimation {
                            proxy.scrollTo(messageID)
                        }
                    }
                }
                .onChange(of: chatViewModel.messages) { target in
                    if let messageID = chatViewModel.messages.last?.id {
                        withAnimation {
                            proxy.scrollTo(messageID)
                        }
                    }
                }
            }
            
            CustomInputView(text: $messageText) {
                //send button pressed in custom inputview
                self.sendMessage()
            }
            
        }
        .navigationTitle(self.user.username)
        .navigationBarTitleDisplayMode(.inline)
        .padding(.vertical)
    }
    
    func sendMessage() {
        chatViewModel.sendMessage(messageText)
        messageText = "" // clear text
    }
}

//struct ChatView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatView()
//    }
//}
