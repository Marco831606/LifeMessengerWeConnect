//
//  ContentView.swift
//  LifeMessengerWeConnect
//
//  Created by Marco Molisano on 19.02.23.
//

import SwiftUI

struct ContentView: View {
    
    let chats = Chat.lifeMessengerChat
    
    @StateObject var viewModel = ChatViewModel()
    
    @State private var query = ""
    
    var body: some View {
        
        NavigationView{
            
            List{
                ForEach(viewModel.getSortedFilteredChats(query: query)) { chat in
                    
                    ZStack {
                        
                        ChatList(chat: chat)
                        
                        NavigationLink(destination: {
                            ChatView(chat: chat)
                                .environmentObject(viewModel)
                                .foregroundColor(.blue)
                        }) {
                            EmptyView()
                        }
                        //     .buttonStyle(PlainListStyle())
                        .frame(width: 0)
                        .opacity(0)
                        
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
                        Button(action: {
                            viewModel.markAsUnread(!chat.hasUnreadMessage, chat: chat)
                        }) {
                            if chat.hasUnreadMessage {
                                Label("Read", systemImage: "text.bubble")
                            }else{
                                Label("Unread", systemImage: "circle.fill")
                            }
                        }
                        .tint(.blue)
                       
                    }
                }
            }
                    
            
            .listStyle(PlainListStyle())
            .searchable(text: $query)
            .navigationTitle("Chats")
            .navigationBarItems(trailing: Button(action:{}) {
                Image(systemName: "square.and.pencil")
            })
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
    

