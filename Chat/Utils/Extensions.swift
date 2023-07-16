//
//  Extensions.swift
//  Chat
//
//  Created by Matthew Houston on 3/28/23.
//

import Foundation
import UIKit

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
