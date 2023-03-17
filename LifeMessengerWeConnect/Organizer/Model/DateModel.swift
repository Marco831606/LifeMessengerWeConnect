//
//  DateModel.swift
//  LifeMessengerWeConnect
//
//  Created by Marco Molisano on 15.03.23.
//

import Foundation

struct WeekDay: Identifiable{
    var id: UUID = .init()
    var string: String
    var date: Date
    var isToday: Bool = false
    
}
