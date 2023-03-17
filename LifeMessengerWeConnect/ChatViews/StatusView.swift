//
//  StatusView.swift
//  LifeMessengerWeConnect
//
//  Created by Marco Molisano on 03.03.23.
//

import SwiftUI

struct StatusView: View {
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            HStack{
                Button{
                    print("Dismiss")
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                }
                
                Spacer()
                
                Button {
                    print("Status")
                } label: {
                    Text("Status")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
            .padding()
            
            HStack{
                Circle()
                .frame(width: 64, height: 64)}
            StatusTextView("Keine Anrufe nur Life Messenger", text: $caption)
        }
    }
  }



