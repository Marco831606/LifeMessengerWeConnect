//
//  UserRowView.swift
//  LifeMessengerWeConnect
//
//  Created by Marco Molisano on 01.03.23.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing: 12){
                Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(Color.blue)
            VStack(alignment: .leading, spacing: 4){
                Text("Michaela Klein")
                    .font(.subheadline).bold()
                    .foregroundColor(Color.black)
                    
                
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical,4)
       
        
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
