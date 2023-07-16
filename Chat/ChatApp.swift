//
//  ChatApp.swift
//  Chat
//
//  Created by Matthew Houston on 3/5/23.
//

import SwiftUI
import Firebase


//this takes the place of the app and scene delegate
@main
struct ChatApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
                .environmentObject(AuthenticationViewModel.shared) //you want to initialize the authentication view model once so that you don't have different view models initialized and tied to different views. you want the same instance of the view model in each view. //AuthenticationViewModel() or Singleton will suffice as far as initializing goes.
        }
    }
}
