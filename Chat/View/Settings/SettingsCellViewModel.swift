//
//  SettingsCellViewModel.swift
//  Chat
//
//  Created by Matthew Houston on 3/24/23.
//

import Foundation
import SwiftUI


//CaseIterable gives us access to allCases parameter to run a for loop... //Int gives each value in the enum an integer value
enum SettingsCellViewModel: Int ,CaseIterable {
    case account
    case notifications
    case starredMessages
    
    var title: String {
        switch self {
        case .account: return "Account"
        case .notifications: return "Notifications"
        case .starredMessages: return "Starred Messages"
        }
    }
    
    var imageName: String {
        switch self {
        case .account: return "key.fill"
        case .notifications: return "bell.badge.fill"
        case .starredMessages: return "star.fill"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .account: return Color.blue
        case .notifications: return Color.red
        case .starredMessages: return Color.yellow
        }
    }
}
