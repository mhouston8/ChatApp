//
//  NewMessageView.swift
//  Chat
//
//  Created by Matthew Houston on 3/27/23.
//

import SwiftUI

struct NewMessageView: View {
    
    //binding this property to the conversations view's showChatView property
    @Binding var showChatView: Bool
    @Environment(\.presentationMode) var mode
    @State private var searchText = ""
    @State private var isEditing = false
    @ObservedObject var viewModel = NewMessageViewModel()
    @Binding var user: User?
    
    var body: some View {
        ScrollView {
            SearchBar(searchText: $searchText, isEditing: $isEditing)
                .onTapGesture { isEditing.toggle() }
                .padding(.top)
            VStack {
                
                ForEach(viewModel.users) { user in //User Model already conforms to identifiable protocol
                    Button {
                        self.showChatView.toggle()
                        self.user = user
                        mode.wrappedValue.dismiss()
                    } label: {
                        UserCell(user: user)
                    }
                }
            }
            .foregroundColor(.black)
        }
    }
}

//struct NewMessageView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewMessageView(showChatView: .constant(true)) //when you have a binding
//    }
//}
