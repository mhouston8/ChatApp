//
//  ChannelCell.swift
//  Chat
//
//  Created by Matthew Houston on 5/24/23.
//

import SwiftUI
import Kingfisher

struct ChannelCell: View {
    
    //@Published var channelViewModel: ChannelViewModel
    
    
    var body: some View {
        NavigationLink(destination: Text("ChatView")) {
            VStack {
                HStack(spacing: 12) {
                    Image(systemName: "person.2.circle.fill") //chat partners profile image url
                        .resizable()
                        .scaledToFill()
                        .frame(width: 48, height: 48)
                        .clipShape(Circle())
                    
                    
                    VStack(alignment: .leading) {
                        Text("Gotham City")
                            .font(.system(size: 14, weight: .semibold))
                        Text("Bruce Wayne: I'm here to save Gotham")
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

struct ChannelCell_Previews: PreviewProvider {
    static var previews: some View {
        ChannelCell()
    }
}

