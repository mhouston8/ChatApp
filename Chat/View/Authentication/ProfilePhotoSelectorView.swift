//
//  ProfilePhotoSelectorView.swift
//  Chat
//
//  Created by Matthew Houston on 4/1/23.
//

import SwiftUI
import UIKit

struct ProfilePhotoSelectorView: View {
    @State private var imagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthenticationViewModel

    var body: some View {
        
        VStack {
            Button {
                self.imagePickerPresented.toggle()
            } label: {
                
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width:340, height:340)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "text.below.photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width:100, height:100)
                }
            }
            
            Text(profileImage == nil ? "Tap to select Profile Photo" : "Great! Tap below to continue")
                .padding()
            
            if let image = selectedImage {
                Button {
                    viewModel.uploadProfileImage(image)
                } label: {
                    Text("Continue")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                }
                .shadow(radius: 10)
            }
        }
        .sheet(isPresented: $imagePickerPresented, onDismiss: {
            loadImage()
        }, content: {
            ImagePicker(image: $selectedImage) //selectedImage changes
        })
        
        Spacer()
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
