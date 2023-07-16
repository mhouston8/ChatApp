//
//  ContentView.swift
//  Chat
//
//  Created by Matthew Houston on 3/5/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthenticationViewModel //don't have to initialize because it's already been initialized.
    
    var body: some View {
        
        Group {
            if viewModel.userSession != nil {
                MainTabView()
            } else {
                LoginView()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
