//
//  EditProfileView.swift
//  Chat
//
//  Created by Matthew Houston on 3/25/23.
//

import SwiftUI

struct EditProfileView: View {
    
    @State var e = ""
    @State var fullName = ""
    @State var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    var body: some View {
        
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 44) {
                VStack(alignment: .leading) {
                    
                    HStack {
                        
                        VStack {
                            if let profileImage = profileImage {
                                profileImage
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 64, height: 64)
                                    .clipShape(Circle())
                            } else {
                                Image("yep")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 64, height: 64)
                                    .clipShape(Circle())
                            }
                        
                            Button {
                                self.showImagePicker.toggle()
                            } label: {
                                Text("Edit")
                                    .font(.system(size: 13))
                            }
                        }
                        .padding(.top)
                        .sheet(isPresented: $showImagePicker, onDismiss: {
                            //imagepicker dismissed
                            self.loadImage()
                        }) {
                            ImagePicker(image: $selectedImage)
                        }
                        
                        TextField("Enter your name or change your profile photo", text: $e)
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                            .padding([.bottom, .horizontal])
                    }
                    
                    Divider()
                        .padding(.horizontal)
                    
                   TextField("Eddie Brock", text: $fullName)
                        .padding(8)
                        
                }
                .background(Color.white)
                
                
                VStack(alignment: .leading) {
                    Text("Status")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .padding([.leading, .bottom])
                    
                    
                    NavigationLink {
                       StatusSelectorView()
                    } label: {
                        HStack {
                            Text("At the movies")
                                .foregroundColor(.blue)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.white)
                    }
                }
                Spacer()
            }
        
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Edit Profile")
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
