//
//  ChannelsView.swift
//  Chat
//
//  Created by Matthew Houston on 3/24/23.
//

import SwiftUI

struct ChannelsView: View {
    
    @State private var showCreateGroupView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack {
                    ForEach((0...10), id: \.self) { _ in
                        ChannelCell()
                    }
                }
            }
            
            FloatingButton(show: $showCreateGroupView)
                .padding()
                .sheet(isPresented: $showCreateGroupView) {
                    SelectGroupMembersView()
                }
        }
    }
}

struct ChannelsView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelsView()
    }
}

struct FloatingButton: View {
    
    @Binding var show: Bool
    
    var body: some View {
        Button {
            self.show.toggle()
        } label: {
            Image(systemName: "square.and.pencil")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .padding()
        }
        .background(Color.blue)
        .foregroundColor(Color.white)
        .clipShape(Circle())
    }
}
