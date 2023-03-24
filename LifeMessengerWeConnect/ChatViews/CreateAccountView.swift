//
//  CreateAccountView.swift
//  LifeMessengerWeConnect
//
//  Created by Marco Molisano on 23.03.23.
//

import SwiftUI

struct CreateAccountView: View {
    @State var LoginMode = false
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(spacing: 16) {
                    Image("Messenger")
                        .resizable()
                        .frame(width: 130, height: 140 )
                        .cornerRadius(50)
                        .offset(x: 125, y: -100)
                        
                   
                       
                    
                    Picker(selection: $LoginMode,  label: Text("")) {
                        Text("Login")
                            .tag(true)
                        Text("Konto erstellen")
                            .tag(false)
                    }.pickerStyle(SegmentedPickerStyle())
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(25)
                    
                    
                    if !LoginMode {
                        
                        Button{
                            
                        } label: {
                            Image(systemName: "person.fill")
                                .font(.system(size: 64))
                                .padding()
                        }
                    }
                    Group{
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            
                        
                        SecureField("Password", text: $password)
                    }
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(25)
                    
                    
                    
                    Button{
                        
                    } label: {
                        HStack{
                            Spacer()
                            Text(LoginMode ? "Login" : "Konto erstellen")
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                            Spacer()
                        }.background(Color.blue)
                            .cornerRadius(25)
                        Spacer()
                    }
                }
                .padding()
            }
           
                .background(Color(.init(white: 0, alpha: 0.03))
                    .ignoresSafeArea())
                .navigationTitle(LoginMode ? "Login" : "Konto erstellen")
            }
        }
    }


struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
