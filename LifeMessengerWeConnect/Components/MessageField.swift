//
//  MessageFieldView.swift
//  LifeMessengerWeConnect
//
//  Created by Marco Molisano on 27.02.23.
//

import Foundation
import SwiftUI


struct MessageField: View {
  @EnvironmentObject var messagesManager: MessagesManager
  @State private var message = ""

 
  var body: some View {
    HStack {
      CustomTextField(placeholder: Text("Nachricht schreiben..."), text: $message)
      Button {
        print("Nachricht versendet")
        messagesManager.sendMessage(text: message)
        message = ""
      } label: {
        Image(systemName: "paperplane.fill")
          .foregroundColor(.white)
          .padding(15)
          .background(Color("Green"))
          .cornerRadius(50)
      }
    }
    .padding(.horizontal)
    .padding(.vertical, 10)
    .background(Color.green.opacity(0.5))
    .cornerRadius(50, corners: [.bottomLeft, .bottomRight])
    .cornerRadius(30, corners: [.topLeft, .topRight])
    .padding()
  }
}
struct MessageField_Previews: PreviewProvider {
  static var previews: some View {
    MessageField()
      .environmentObject(MessagesManager())
  }
}
struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editigChanged: (Bool) -> () = {_ in}
    var commit: () -> () = {}
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .opacity(0.5)
            }
            TextField("", text: $text, onEditingChanged: editigChanged, onCommit: commit)
        }
    }
}
        
