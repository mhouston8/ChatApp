//
//  SelectedGroupMembersView.swift
//  Chat
//
//  Created by Matthew Houston on 5/28/23.
//

import SwiftUI
import Kingfisher

struct SelectedGroupMembersView: View {
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach((0 ... 10), id: \.self) { _ in
                    ZStack(alignment: .topTrailing) {
                        VStack {
                            Image("yep")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                                .shadow(color: .gray, radius: 4, x: 0, y: 2)
                            Text("Fullname Here")
                                .font(.system(size: 11, weight: .semibold))
                                .multilineTextAlignment(.center)
                        }
                        .frame(width: 64)
                        
                        
                        Button {
                            print(Text(""))
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 10, height: 10)
                                .padding(4)
                        }
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                    }
                }
            }
        }
        .animation(.spring()) //scrollview animation when a new user is added to the group
        .padding()
    }
}

struct SelectedGroupMembersView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedGroupMembersView()
    }
}
