//
//  CustomTextField.swift
//  Chat
//
//  Created by Matthew Houston on 3/21/23.
//

import SwiftUI

struct CustomTextField: View {
    let placeholder: String
    let imageName: String
    var isSecure: Bool = false
    @Binding var emailText: String
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
                
                if isSecure {
                    SecureField(placeholder, text: $emailText)
                } else {
                    TextField(placeholder, text: $emailText)
                }
            }
            Divider()
                .background(Color.gray)
        }
    }
}
