//
//  ConversationsView.swift
//  Chat
//
//  Created by Matthew Houston on 3/24/23.
//

import SwiftUI

struct ConversationsView: View {
    
    @State var showNewMessageView = false
    @State private var showChatView = false
    @State var selectedUser: User? //bound to the NewMessageView
    @ObservedObject var conversationsViewModel = ConversationsViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            if let user = selectedUser {
                NavigationLink("", destination: ChatView(user: user), isActive: $showChatView)
            }
            
            ScrollView {
                VStack {
                    ForEach((conversationsViewModel.recentMessages)) { message in
                        ConversationCell(conversationCellViewModel: ConversationCellViewModel(message: message))
                    }
                }
            }
            
            
            HStack {
                Spacer()
                FloatingButton(show: $showNewMessageView)
                    .sheet(isPresented: $showNewMessageView) {
                        NewMessageView(showChatView: $showChatView, user: $selectedUser)
                    }
            }
            .padding([.trailing, .bottom], 15)

        }
        .navigationTitle("Chats")
        .onChange(of: conversationsViewModel.recentMessages, perform: { newValue in
            conversationsViewModel.fetchRecentMessages()
        })
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
