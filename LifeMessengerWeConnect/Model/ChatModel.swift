//
//  ChatModel.swift
//  LifeMessengerWeConnect
//
//  Created by Marco Molisano on 19.02.23.
//

import Foundation

struct Chat: Identifiable {
    var id: UUID { person.id}
    let person: Person
    var messages:[Message]
    var hasUnreadMessage = false
}

struct Person: Identifiable {
    let id = UUID()
    let name: String
    let imgString: String
}

struct Message: Identifiable {
    
    enum MessageType {
        case Sent, Received
    }
    
    
    let id = UUID()
    let date: Date
    let text: String
    let type: MessageType
    
    init(_ text: String, type: MessageType, date: Date) {
        self.date = date
        self.type = type
        self.text = text
    }
    
    init(_ text: String, type: MessageType) {
        self.init(text, type: type, date: Date())
    }
}

extension Chat {
    
    static let lifeMessengerChat = [
        Chat(person: Person(name: "Andi", imgString: "Avatar1"), messages: [
            Message("Hey Andi, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("Hey Marcel, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Hey Heinrich, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Hey Timo, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 4)),
            Message("Hey Lukas, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
        ], hasUnreadMessage: true),
        
        Chat(person: Person(name: "Marco", imgString: "Avatar6"), messages: [
            Message("Hey Andi, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("Hey Marcel, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Hey Heinrich, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Hey Timo, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 4)),
            Message("Hey Lukas, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 5)),
        ], hasUnreadMessage: true),
             
        Chat(person: Person(name: "Michaela", imgString: "Avatar2"), messages: [
                Message("Hey Andi, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
                Message("Hey Marcel, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
                Message("Hey Heinrich, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
                Message("Hey Timo, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 4)),
                Message("Hey Lukas, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 5)),
        ], hasUnreadMessage: true),
            
        Chat(person: Person(name: "Julia", imgString: "Avatar4"), messages: [
                Message("Hey Andi, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
                Message("Hey Marcel, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
                Message("Hey Heinrich, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
                Message("Hey Timo, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 4)),
                Message("Hey Lukas, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 5)),
        ], hasUnreadMessage: true),
                
        Chat(person: Person(name: "Timo", imgString: "Avatar7"), messages: [
                    Message("Hey Andi, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
                    Message("Hey Marcel, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
                    Message("Hey Heinrich, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
                    Message("Hey Timo, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 4)),
                    Message("Hey Lukas, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
        ], hasUnreadMessage: true),
                
        Chat(person: Person(name: "Daniela", imgString: "Avatar5"), messages: [
                    Message("Hey Andi, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
                    Message("Hey Marcel, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
                    Message("Hey Heinrich, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
                    Message("Hey Timo, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 4)),
                    Message("Hey Lukas, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 5)),
        ], hasUnreadMessage: true),
                     
        Chat(person: Person(name: "Michaela", imgString: "Avatar2"), messages: [
                        Message("Hey Andi, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
                        Message("Hey Marcel, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
                        Message("Hey Heinrich, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
                        Message("Hey Timo, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 4)),
                        Message("Hey Lukas, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 5)),
                ], hasUnreadMessage: true),
                    
        Chat(person: Person(name: "Ernst", imgString: "Avatar8"), messages: [
                        Message("Hey Andi, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
                        Message("Hey Marcel, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
                        Message("Hey Heinrich, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
                        Message("Hey Timo, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 4)),
                        Message("Hey Lukas, wie gehts dir?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 5)),
       ]),
   ]
    
    
}
    
