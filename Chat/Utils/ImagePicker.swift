//
//  ImagePicker.swift
//  Chat
//
//  Created by Matthew Houston on 3/27/23.
//

import Foundation
import SwiftUI


//bridge between UIKit and SwiftUI
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var mode
    
    //this function will convert the uikit viewcontroller into a swiftui view, essentially.
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    //handle all bridging, essentially
    func makeCoordinator() -> Coordinator {
        return Coordinator(imagePicker: self)
    }
    
    //need this function
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(imagePicker: ImagePicker) {
            self.parent = imagePicker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.originalImage] as? UIImage else { return }
            self.parent.image = image
            self.parent.mode.wrappedValue.dismiss()
        }
        
    }
    
}
