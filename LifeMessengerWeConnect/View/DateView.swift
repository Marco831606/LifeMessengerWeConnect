//
//  DateView.swift
//  LifeMessengerWeConnect
//
//  Created by Marco Molisano on 19.02.23.
//

import Foundation

extension Date {
    
    func descriptiveString(dateStyle: DateFormatter.Style = .short) -> String {
       
    
    let formatter = DateFormatter()
    formatter.dateStyle = dateStyle
    
    let daysBetween = self.daysBetween(date: Date())
        
        if daysBetween == 0 {
            return "Heute"
        }
        else if daysBetween == 1 {
            return "Gestern"
        }
        else if daysBetween < 5 {
            let weekdayIndex = Calendar.current.component(.weekday, from: self) - 1
            return formatter.string(from: self)
        }
    
    return "Heute"
}
 
    func daysBetween(date: Date) -> Int {
        let calender = Calendar.current
        let date1 = calender.startOfDay(for: self)
        let date2 = calender.startOfDay(for: date)
        
        if let daysBetween = calender.dateComponents([.day], from: date1, to: date2).day {
            return daysBetween
        }
        return 0
    }
}
