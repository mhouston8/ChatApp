//
//  LoginView.swift
//  Chat
//
//  Created by Matthew Houston on 3/5/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var emailText = ""
    @State private var passwordText = ""
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading, spacing: 12) {
                
                HStack { Spacer() } //shoves to left side of screen
                
                Text("Hello.")
                    .font(.largeTitle)
                    .bold()
                
                Text("Welcome Back")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
                
                
                VStack(spacing: 40) {
                    CustomTextField(placeholder: "Email", imageName: "envelope",  isSecure: false, emailText: $emailText)
                    CustomTextField(placeholder: "Password", imageName: "lock", isSecure: true, emailText: $passwordText)
                }
                .padding([.top, .horizontal], 32)
                
                HStack {
                    Spacer()
                    
                    NavigationLink(destination: Text("Reset Password..")) {
                        Text("Forgot Password?")
                            .font(.system(size: 13, weight: .semibold))
                            .padding(.top)
                            .padding(.trailing, 28)
                    }
                    
                }
                
                Button {
                    print("Signing in user..")
                    authViewModel.login(withEmail: emailText, password: passwordText)
                } label: {
                    Text("Sign In")
                        .frame(width: 340, height: 50)
                        .font(.headline)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(radius: 10)

                Spacer()
                
                HStack {
                    Spacer()
                    NavigationLink(destination: RegistrationView().navigationBarBackButtonHidden(true)) {
                        Text("Don't have an account?")
                            .font(.system(size: 14))
                        Text("Sign Up")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    Spacer()
                }
            }
            .padding([.top, .leading])
        }.padding(.top, 60)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

