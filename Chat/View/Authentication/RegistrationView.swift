//
//  RegistrationView.swift
//  Chat
//
//  Created by Matthew Houston on 3/5/23.
//

import SwiftUI
import UIKit

struct RegistrationView: View {
    
    @State private var emailText = ""
    @State private var fullName = ""
    @State private var userName = ""
    @State private var passwordText = ""
    @Environment(\.presentationMode) var mode //dismiss view
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    var body: some View {
        VStack {
            
            //when user authenticates take user to profile photo selector view
            NavigationLink("", destination: ProfilePhotoSelectorView(), isActive: $authViewModel.didAuthenticateUser)
            
            VStack(alignment: .leading, spacing: 12) {
                
                HStack { Spacer() } //shoves to left side of screen

                Text("Get Started..")
                    .font(.largeTitle)
                    .bold()
                
                Text("Create your account.")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
                
                
                VStack(spacing: 40) {
                    CustomTextField(placeholder: "Email", imageName: "envelope",  isSecure: false, emailText: $emailText)
                    CustomTextField(placeholder: "Username", imageName: "envelope",  isSecure: false, emailText: $userName)
                    CustomTextField(placeholder: "Full Name", imageName: "envelope",  isSecure: false, emailText: $fullName)
                    CustomTextField(placeholder: "Password", imageName: "lock", isSecure: true, emailText: $passwordText)
                }
                .padding([.top, .horizontal], 25)
            
            }
            .padding(.leading)
            
            Button {
                print("Registering user...")
                authViewModel.register(withEmail: emailText, password: passwordText, fullname: fullName, username: userName)
            } label: {
                Text("Sign Up")
                    .frame(width: 340, height: 50)
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .clipShape(Capsule())
                    .padding()
            }
            .padding(.top, 24)
            .shadow(radius: 10)
            
            Spacer()
            
            Button {
                mode.wrappedValue.dismiss()
                print("Handle Sign Up")
            } label: {
                HStack {
                    Spacer()
                        Text("Already have an account?")
                            .font(.system(size: 14))
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    Spacer()
                }
                    .padding()
            }
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
