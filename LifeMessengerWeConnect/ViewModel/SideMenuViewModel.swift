//
//  SideMenuViewModel.swift
//  LifeMessengerWeConnect
//
//  Created by Marco Molisano on 02.03.23.
//

import Foundation

enum SideMenuViewModel: Int, CaseIterable {
case profile
case chatmessenger
case organizer
case events
case logout
    
    var title: String {
        switch self {
        case .profile: return "Profile"
        case .chatmessenger: return "Chatmessenger"
        case .organizer: return "Organizer"
        case .events: return "Events"
        case .logout: return "Logout"
        }
    }
    
    var imageName: String {
        switch self {
        case .profile: return "person"
        case .chatmessenger: return "message"
        case .organizer: return "bookmark"
        case .events: return "party.popper"
        case .logout: return "arrow.left.square"
            
        }
        
    }
}
