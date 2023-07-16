//
//  AuthenticationViewModel.swift
//  Chat
//
//  Created by Matthew Houston on 3/30/23.
//

import Foundation
import Firebase
import FirebaseStorage
import UIKit


class AuthenticationViewModel: NSObject, ObservableObject {
    
    @Published var didAuthenticateUser = false
    @Published var userSession: FirebaseAuth.User? //used to determine which interface to show the user
    private var tempCurrentUser: FirebaseAuth.User? //temporary user for other functionality
    @Published var currentUser: User? //our own user model
    
    static let shared = AuthenticationViewModel() //opening a singleton as another option to init the authview model
    
    override init() {
        super.init() //inheriting from NSObject class
        userSession = Auth.auth().currentUser //do we have a logged in user
        self.fetchUser()
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error { print("DEBUG: There was an error signing in. Reason: " + error.localizedDescription)
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authDataResult, error in
            if let error = error { print("DEBUG: There was an error creating the user in Firebase " + error.localizedDescription)
                return
            }
            
            print("DEBUG: Successfully registered user.")
            
            guard let user = authDataResult?.user else { return }
            self.tempCurrentUser = user
            let data: [String: Any] = ["email" : email, "username": username, "fullname": fullname]
            
            COLLECTION_USERS.document(user.uid).setData(data) { _ in
                print("DEBUG: Saved user to database")
                self.didAuthenticateUser = true
            }
            
        }
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempCurrentUser?.uid else {
            print("Failed to set tempCurrentUser")
            return
        }
        
        ImageUploader.uploadImage(image: image) { imageURLLocation in
            //save to user db
            COLLECTION_USERS.document(uid).updateData(["profileImageUrl": imageURLLocation]) { error in
                if let error = error {
                    print("Error uploading profile image url to user collection database")
                    return
                }
                
                self.userSession = self.tempCurrentUser
                self.fetchUser()
                print("Successfully uploaded profile picture into firebase.")
            }
        }
    }
    
    func signOut() {
        do {
            self.userSession = nil
            try Auth.auth().signOut()
            print("DEBUG: Signed out current user")
        }
        catch(let e) {
            print(e)
        }
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else  { return }
        
        COLLECTION_USERS.document(uid).getDocument { snapshot, error in
            guard let user = try? snapshot?.data(as: User.self) else {
                print("DEBUG: Error fetching user.")
                return
                
            }
            self.currentUser = user
            print("DEBUG: User = \(user)")
        }
        
    }
    
}
