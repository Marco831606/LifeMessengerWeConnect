//
//  ChatView.swift
//  LifeMessengerWeConnect
//
//  Created by Marco Molisano on 20.02.23.
//

import SwiftUI

struct ChatView: View {
    
    @EnvironmentObject var viewModel: ChatViewModel
    
    let chat: Chat
    @State private var text = ""
    @FocusState private var isFocused
    @State private var messageIDScroll: UUID?
    
    var body: some View {
        VStack(spacing: 0) {
            GeometryReader { reader in
                ScrollView {
                    ScrollViewReader { scrollReader in
                        getMessageView(viewWidth: reader.size.width)
                            .padding(.horizontal)
                            .onChange(of: messageIDScroll) { _ in
                                if let messageID = messageIDScroll {
                                    scrollTo(messageID: messageID, shouldAnimate: true,
                                             scrollReader: scrollReader)
                                }
                            }
                            .onAppear {
                                if let messageID = chat.messages.last?.id {
                                    scrollTo(messageID: messageID, anchor: .bottom,
                                             shouldAnimate: false, scrollReader: scrollReader)
                                }
                            }
                    }
                }
            }
            .padding(.bottom, 5)
            
            toolbarView()
        }
        .padding(.top, 1)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: navBarLeadingBtn, trailing: navBarTrailingBtn)
        onAppear() {
            viewModel.markAsUnread(false, chat: chat)
        }
    
    
        func toolbarView() -> some View {
            VStack{
                let height: CGFloat = 37
                HStack{
                    TextField("Nachrichten...", text: $text)
                        .padding(.horizontal, 10)
                        .frame(height: height)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 13))
                        .focused($isFocused)
                }
            }
        
    
    
        var navBarLeadingBtn: some View {
            Button(action: {}) {
                HStack {
                    Image(chat.person.imgString)
                        .resizable()
                        .frame(width:  40, height: 40)
                        .clipShape(Circle())
                    Text(chat.person.name).bold()
                }
                .foregroundColor(.black)
                
            }
        }
    }
    
    var navBarTrailingBtn: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "video")
                
            }
            
            Button(action: {}) {
                Image(systemName: "phone")
            }
        }
    }
    
    func scrollTo(messageID: UUID, anchor: UnitPoint? = nil, shouldAnimate: Bool, scrollReader:
                  ScrollViewProxy) {
        DispatchQueue.main.async {
            withAnimation(shouldAnimate ? Animation.easeIn : nil) {
                
            }
        }
    }
    
    func toolbarView() -> some View {
        VStack{
            let height: CGFloat = 37
            HStack {
                TextField("Nachricht...", text: $text)
                    .padding(.horizontal, 10)
                    .frame(height: height)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 13))
                    .focused($isFocused)
                
                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                        .frame(width: height, height: height)
                        .background(
                            Circle()
                                .foregroundColor(text.isEmpty ? .gray: .blue))
                }
                .disabled(text.isEmpty)
            }
            .frame(height: height)
        }
        .padding(.vertical)
        .padding(.horizontal)
        .background(.thickMaterial)
    }
    
    
    func sendMessage() {
        if let message = viewModel.sendMessage(text, in: chat) {
            text = ""
            messageIDScroll = message.id
        }
    }
    
    
    
    
    let columns = [GridItem(.flexible(minimum: 10))]
    
    func getMessageView(viewWidth: CGFloat) -> some View {
        LazyVGrid(columns: columns, spacing: 0) {
            ForEach(chat.messages) { message in
                let isReceived = message.type == .Received
                HStack{
                    ZStack{
                        Text(message.text)
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                            .background(isReceived ? Color.black.opacity(0.2) : .green.opacity(0.9))
                    }
                    .frame(width: viewWidth * 0.5, alignment: isReceived ? .leading : .trailing)
                    .padding(.vertical)
                    .background(Color.blue)
                }
                .frame(maxWidth: .infinity, alignment: isReceived ? .leading : .trailing)
                
                
                
            }
        }
    }
    
            
            
            
            
            
            
            
            
            
            func sectionHeader(firstMessage message: Message) -> some View {
                ZStack {
                    Text(message.date.descriptiveString(dateStyle: .medium))
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(width: 120)
                        .padding(.vertical, 5)
                        .background(Capsule().foregroundColor(.blue))
                }
                .padding(.vertical, 5)
                .frame(maxWidth: .infinity)
            }
        }
        
        
        
        
        
        
        struct ChatView_Previews: PreviewProvider {
            static var previews: some View {
                NavigationView {
                    
                    
                    ChatView(chat: Chat.lifeMessengerChat[0])
                        .environmentObject(ChatViewModel())
                }
            }
        }
    

