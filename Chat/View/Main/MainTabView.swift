//
//  MainTabView.swift
//  Chat
//
//  Created by Matthew Houston on 3/24/23.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selectedIndex = 0
    @EnvironmentObject var authViewModel: AuthenticationViewModel //environment is observed by default
    
    var body: some View {
        if let user = authViewModel.currentUser {
            //parent tab view will contain navigation view instead of each view in the tab view
            NavigationView {
                TabView(selection: $selectedIndex) {
                    ConversationsView()
                        .tabItem {Image(systemName: "bubble.left")}
                        .onTapGesture {
                            selectedIndex = 0
                        }
                        .tag(0)
                    
                    ChannelsView()
                        .tabItem {Image(systemName: "bubble.left.and.bubble.right")}
                        .onTapGesture {
                            selectedIndex = 1
                        }
                        .tag(1)
                    
                    SettingsView(user: user)
                        .onTapGesture {selectedIndex = 2}
                        .tabItem {Image(systemName: "gear")}
                        .tag(2)
                }
                .navigationTitle(tabTitle)
            }
        } else {
            
        }
    }
    
    var tabTitle: String {
        switch selectedIndex {
        case 0: return "Chats"
        case 1: return "Channels"
        case 2: return "Settings"
        default: return ""
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
