//
//  SideMenuView.swift
//  LifeMessengerWeConnect
//
//  Created by Marco Molisano on 02.03.23.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 32){
            VStack(alignment: .leading){
                Circle()
                    .frame(width: 50, height: 50)
                    .padding()
                    .offset(x: -5, y: 25)
                
                VStack(alignment: .leading, spacing: 4){
                    Text("Michaela Klein")
                        .font(.headline)
                        .padding()
                        .offset(x: 1, y: 1)
                }
                
                
                
                ForEach(SideMenuViewModel.allCases, id: \.rawValue) { option in
                    if option == .profile {
                        NavigationLink {
                            UserProfil()
                        } label: {
                            
                        }
                    }
                    HStack(spacing: 15){
                        Image(systemName: option.imageName)
                            .font(.headline)
                            .foregroundColor(.green)
                        
                        Text(option.title)
                            .font(.subheadline)
                        
                        Spacer()
                        
                    }
                    .frame(height: 40)
                    .padding(.horizontal)
                }
                .padding(.vertical, 5)
                
                Spacer()
            }
        }
    }
}
    
    
    struct SideMenuView_Previews: PreviewProvider {
        static var previews: some View {
            SideMenuView()
        }
    }

