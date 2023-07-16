//
//  ImageUploader.swift
//  Chat
//
//  Created by Matthew Houston on 4/22/23.
//

import Foundation
import Firebase
import FirebaseStorage
import UIKit


//Separate Storage Bucket For Images
struct ImageUploader {
    
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {
            completion("")
            return
        }
    
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        ref.putData(imageData) { _, error in
            if let error = error {
                print("Failed to upload profile image to firebase")
                return
            }
            
            ref.downloadURL { url, error in
                //profile image url internet location
                guard let imageURL = url?.absoluteString else { return }
                completion(imageURL)
            }
        }
        
    }
    
}
