//
//  CustomInputView.swift
//  Chat
//
//  Created by Matthew Houston on 3/28/23.
//

import SwiftUI

struct CustomInputView: View {
    
    @Binding var text: String
    
    //action for button is being passed from parent
    var action: () -> Void //function with a void return type
    
    var body: some View {
        VStack {
            Rectangle() //In place of divider
                .foregroundColor(Color(.separator))
                .frame(width: UIScreen.main.bounds.width, height: 0.7)
            
            HStack {
                TextField("Message...", text: $text)
                    .textFieldStyle(.plain)
                    .font(.body)
                    .frame(minHeight: 30)
                
                Button(action: action, label: {
                    Text("Send")
                        .foregroundColor(.black)
                        .bold()
                })
                
            }
            .padding(.bottom, 8)
            .padding(.horizontal)
        }
    }
}

struct CustomInputView_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputView(text: .constant("")) {

        }
    }
}
