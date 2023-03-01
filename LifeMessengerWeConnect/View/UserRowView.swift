//
//  UserRowView.swift
//  LifeMessengerWeConnect
//
//  Created by Marco Molisano on 01.03.23.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack{
            Circle()
                .frame(width: 50, height: 50)
            VStack(alignment: .leading, spacing: 4){
                Text("Michaela Klein")
                    .font(.subheadline).bold()
                
            }
            Spacer()
        }
        .padding()
        .background(Color.blue)
        .cornerRadius(40)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
