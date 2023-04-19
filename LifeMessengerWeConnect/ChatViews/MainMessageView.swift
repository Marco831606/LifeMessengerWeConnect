//
//  MainMessageView.swift
//  LifeMessengerWeConnect
//
//  Created by Marco Molisano on 17.04.23.
//

import SwiftUI

struct MainMessageView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing: 16) {
                    Image(systemName: "person")
                        .font(.system(size: 24, weight: .heavy))
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Username")
                            .font(.system(size: 24, weight: .bold))
                        HStack {
                            Circle()
                                .foregroundColor(Color.green)
                                .frame(width: 14)
                            Text("online")
                                .font(.system(size: 12))
                                .foregroundColor(Color.green)
                        }
                    }
                    Spacer()
                    Image(systemName: "gearshape")
                }
                .padding()
                ScrollView {
                    ForEach(0..<20, id: \.self) { num in
                        VStack {
                            HStack(spacing: 16) {
                                Image(systemName: "person.fill")
                                    .font(.system(size: 32))
                                    .padding(8)
                                    .overlay(RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color.black, lineWidth: 1))
                                VStack(alignment: .leading) {
                                    Text("Username")
                                        .font(.system(size: 16, weight: .semibold))
                                    Text("Nachrichten")
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundColor(Color(.gray))
                                }
                                Spacer()
                               
                            }
                            Divider()
                                .padding(.vertical, 8)
                        }.padding(.horizontal)
                    }
                }
                Button {
                } label: {
                    HStack {
                        Spacer()
                        Text(" + Neue Nachricht")
                            .font(.system(size: 16, weight: .bold))
                        Spacer()
                    }
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .background(Color.blue)
                    .cornerRadius(32)
                    .padding(.horizontal)
                    
                }
                
                }.navigationBarHidden(true)
            }
        }
    }


struct MainMessageView_Previews: PreviewProvider {
    static var previews: some View {
        MainMessageView()
    }
}
