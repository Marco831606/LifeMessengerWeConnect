//
//  TitleRow.swift
//  LifeMessengerWeConnect
//
//  Created by Marco Molisano on 27.02.23.
//

import SwiftUI

struct TitleRow: View {
    var imageUrl = URL (string: "https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80")
    var name = "Michaela Klein"
    
    var body: some View {
        
        HStack(spacing: 20) {
            AsyncImage(url: imageUrl) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title).bold()
                Text("Online")
                    .font(.caption)
                    .foregroundColor(.blue)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "phone.fill")
                .foregroundColor(.green)
                .padding(10)
                .background(.white)
                .cornerRadius(50)
        }
        .padding(8)
    }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow()
            .background(Color("Skyblue"))
    }
}

