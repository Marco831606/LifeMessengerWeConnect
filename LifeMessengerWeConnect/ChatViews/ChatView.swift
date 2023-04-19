//
//  ChatView.swift
//  LifeMessengerWeConnect
//
//  Created by Marco Molisano on 03.03.23.
//

import SwiftUI

struct ChatView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var messagesManager = MessagesManager()
    
    var body: some View {
     
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                Button{
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                        .contentShape(Rectangle())
                }
                TitleRow()
                
                ScrollViewReader { proxy in
                    ScrollView {
                        ForEach(messagesManager.messages, id: \.id) {
                            message in MessageBubble(message: message)
                        }
                    }
                    .padding(.top, 12)
                    .background(Color(.systemIndigo))
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                    .onChange(of: messagesManager.lastMessageId) { id in
                        withAnimation {
                            proxy.scrollTo(id, anchor: .bottom)
                        }
                    }
                }
                
            }
            .background(Color.black)
            //.cornerRadius(25)
            
            
            MessageField()
                .environmentObject(messagesManager)
        }
        .background(Color.black)
    }
}
       


struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
