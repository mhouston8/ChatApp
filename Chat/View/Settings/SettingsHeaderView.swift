//
//  SettingsHeaderView.swift
//  Chat
//
//  Created by Matthew Houston on 3/24/23.
//

import Foundation
import SwiftUI
import Kingfisher


struct SettingsHeaderView: View {
    private var user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        HStack {
            KFImage(URL(string: user.profileImageUrl ?? ""))
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
                .padding(.leading)
            
            
            VStack(alignment: .leading, spacing: 4) {
                Text(user.fullname)
                    .font(.system(size: 18))
                Text("Available")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
        .frame(height: 80)
        .background(.white)
    }
}
