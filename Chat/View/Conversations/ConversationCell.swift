//
//  UserCell.swift
//  Chat
//
//  Created by Matthew Houston on 3/27/23.
//
 
import SwiftUI
import Kingfisher

struct ConversationCell: View {
    @ObservedObject var conversationCellViewModel: ConversationCellViewModel //could use a ConversationCell viewmodel..could also create a protocol that the view model inherits from.
    
    var body: some View {
        if let user = conversationCellViewModel.message.user {
            NavigationLink(destination: ChatView(user: user)) {
                VStack {
                    HStack(spacing: 12) {
                        KFImage(conversationCellViewModel.chatPartnerProfileImageUrl) //chat partners profile image url
                            .resizable()
                            .scaledToFill()
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                            
                        
                        VStack(alignment: .leading) {
                            Text(conversationCellViewModel.fullName)
                                .font(.system(size: 14, weight: .semibold))
                            Text(conversationCellViewModel.message.text)
                                .font(.system(size: 15))
                        }
                        .foregroundColor(.black)
                        
                        Spacer()
                    }.padding(.leading)
                    
                    Divider()
                }
                .padding(.top)
            }
        }
    }
}

//struct ConversationCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ConversationCell()
//    }
//}
