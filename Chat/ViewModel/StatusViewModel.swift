//
//  StatusViewModel.swift
//  Chat
//
//  Created by Matthew Houston on 3/26/23.
//

import Foundation
import SwiftUI

enum UserStatus: Int, CaseIterable {
    
    case notConfigured
    case available
    case busy
    case school
    case movies
    case work
    case batteryLow
    case meeting
    case gym
    case sleeping
    case urgentCallsOnly
    
    var title: String {
        switch self {
        case .notConfigured: return "Not Configured"
        case .available: return "Available"
        case .busy: return "Busy"
        case .school: return "School"
        case .movies: return "Movies"
        case .work: return "Work"
        case .batteryLow: return "Battery Low"
        case .meeting: return "Meeting"
        case .gym: return "Gym"
        case .sleeping: return "Sleeping"
        case .urgentCallsOnly: return "Urgent Calls Only"
        }
    }
    
}

class StatusViewModel: ObservableObject {
    
    @Published var status: UserStatus = .notConfigured
    
    func updateStatus(status: UserStatus) {
        self.status = status
    }
    
}
