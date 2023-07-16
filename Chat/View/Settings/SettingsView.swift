//
//  SettingsView.swift
//  Chat
//
//  Created by Matthew Houston on 3/24/23.
//

import SwiftUI

struct SettingsView: View {
    //1 way to access the authViewModel
    //@EnvironmentObject var authViewModel: AuthenticationViewModel
    private var user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                NavigationLink {
                    EditProfileView()
                } label: {
                    SettingsHeaderView(user: user)
                }
                
                VStack(spacing: 1) {
                    ForEach(SettingsCellViewModel.allCases, id: \.self) { viewModel in
                        SettingsCell(viewModel: viewModel)
                    }
                }
                
                
                Button {
                    //accessing the auth view model's singleton instead of the environment object
                    AuthenticationViewModel.shared.signOut()
                } label: {
                    Text("Log Out")
                        .foregroundColor(.red)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: UIScreen.main.bounds.width, height: 50)
                        .background(Color.white)
                }

                
                Spacer()
            }
        }
    }
}
