//
//  TweetFilterViewModel.swift
//  LifeMessengerWeConnect
//
//  Created by Marco Molisano on 03.03.23.
//

import Foundation

enum TweetFilterViewModel: Int, CaseIterable {
    case chats
    case status
    case call
    
    var title: String {
        switch self {
        case .chats: return "Chats"
        case .status: return "Status"
        case .call: return "Anrufe"
        }
    }
}
