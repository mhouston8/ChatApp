//
//  MessageView.swift
//  Chat
//
//  Created by Matthew Houston on 3/28/23.
//

import SwiftUI
import Kingfisher

struct MessageView: View {
    
    let messageViewModel: MessageViewModel
    
    var body: some View {
        HStack {
            if messageViewModel.isFromCurrentUser {
                Spacer()
                Text(messageViewModel.message.text)
                        .padding(12)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .font(.system(size: 15))
                        .clipShape(ChatBubble(isFromCurrentUser: messageViewModel.isFromCurrentUser))
                        .padding(.leading, 80)
                        .padding(.horizontal)
            } else {
                HStack {
                    KFImage(messageViewModel.profileImageUrl)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                    
                    Text(messageViewModel.message.text)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .foregroundColor(.black)
                        .font(.system(size: 15))
                        .clipShape(ChatBubble(isFromCurrentUser: messageViewModel.isFromCurrentUser))
                }
                .padding(.horizontal)
                .padding(.trailing, 80)
                
                Spacer()
                
            }
        }
    }
}

//struct MessageView_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageView(messageText: "", isFromCurrentUser: false)
//    }
//}
