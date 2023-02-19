//
//  ChatList.swift
//  LifeMessengerWeConnect
//
//  Created by Marco Molisano on 19.02.23.
//

import SwiftUI

struct ChatList: View {
    
    let chat: Chat
    
    var body: some View {
        HStack(spacing: 20){
            Image(chat.person.imgString)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            ZStack{
                VStack(alignment: .leading, spacing: 5) {
                    HStack{
                        Text(chat.person.name)
                            .bold()
                        Spacer()
                        Text(chat.messages.last?.date.DateString() ?? "")
                    }
                    
                    HStack{
                        Text(chat.messages.last?.text ?? "")
                    
                    }
                }
                
                Circle()
                    .foregroundColor(chat.hasUnreadMessage ? .blue : .clear)
                    .frame(width: 18, height: 18)
                    .frame(maxWidth: .infinity, alignment: .trailing )
            }
        }
        .frame(height: 80)
    }
}
            
    

struct ChatList_Previews: PreviewProvider {
    static var previews: some View {
        ChatList(chat: Chat.lifeMessengerChat[0])
    }
}
