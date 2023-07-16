//
//  UserCell.swift
//  Chat
//
//  Created by Matthew Houston on 3/27/23.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    
    var user: User
    
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                KFImage(URL(string: user.profileImageUrl ?? ""))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                    
                
                VStack(alignment: .leading) {
                    Text(user.username)
                        .font(.system(size: 14, weight: .semibold))
                    Text(user.fullname)
                        .font(.system(size: 15))
                }
                
                Spacer()
            }.padding(.leading)
        }
        .padding(.top)
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell(user: User(email: "Email Here", fullname: "Fullname Here", profileImageUrl: "", username: "Username Here"))
    }
}
