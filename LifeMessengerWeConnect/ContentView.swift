//
//  ContentView.swift
//  LifeMessengerWeConnect
//
//  Created by Marco Molisano on 19.02.23.
//

import SwiftUI

struct ContentView: View {
    
    let chats = Chat.lifeMessengerChat
    
    var body: some View {
        NavigationView{
            List{
                ForEach(chats) { chat in
                    ChatList(chat: chat)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Chatroom")
            .navigationBarItems(trailing: Button(action:{}) {
                Image(systemName: "square.and.pencil")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
