//
//  ExplorerView.swift
//  LifeMessengerWeConnect
//
//  Created by Marco Molisano on 01.03.23.
//

import SwiftUI

struct ExplorerView: View {
    @State private var selctedFilter: TweetFilterViewModel = .chats
    
    var body: some View {
        
        NavigationView{
            VStack{
                HStack {
                    ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { item in
                        VStack {
                            
                            Text(item.title)
                                .font(.subheadline)
                                .fontWeight(selctedFilter == item ? .semibold : .regular)
                                .foregroundColor(selctedFilter == item ? .black : .gray)
                            
                            if selctedFilter == item {
                                Capsule()
                                    .foregroundColor(Color(.white))
                                    .frame(height: 3)
                            } else {
                                Capsule()
                                    .foregroundColor(Color(.clear))
                                    .frame(height: 3)
                            }
                        }
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                self.selctedFilter = item
                                
                            }
                            
                        }
                        
                    }
                }
                
                
                Spacer()
                

                
                ScrollView{
                    ForEach(0 ... 20, id: \.self) { _ in
                        NavigationLink {
                            ChatView()
                        } label: {
                            UserRowView()
                        }
                    }
                }
            }
            
            
            .navigationTitle("Chats")
            .offset(x: 5, y: 50)
            .navigationBarTitleDisplayMode(.inline)
            .background(Color(.systemGreen))
            
            
            
        }
        
    }
}

    
    
    struct ExplorerView_Previews: PreviewProvider {
        static var previews: some View {
            ExplorerView()
        }
    }

