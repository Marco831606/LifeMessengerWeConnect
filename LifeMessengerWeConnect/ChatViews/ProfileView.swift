//
//  ProfileView.swift
//  LifeMessengerWeConnect
//
//  Created by Marco Molisano on 01.03.23.
//

import SwiftUI

struct UserProfil: View {
    @State var date: Date = Date()
    @State var yourColor = Color.accentColor
    @State var darkModus = false
    @State var leseModus = false
    @State var schrift = false
    @State var genderChoice: Int = 0
    
    var settings = ["Male", "Female", "Diverse"]
    var edit: Bool = false
    var body: some View {
        
        VStack{
            
            
            Image(systemName: "circle.fill")
            
            
            
            Text ("Dein Profil")
                
                
            
            Image("")
            Form{
                
                
                Text("Vorname:                                               Michaela")
                Text("Nachname:                                            Klein")
                Text("Adresse:                                    Musterstr.10,1234567 Musterhausen")
                Text("Email: michaela.klein@hallo.de")
                
                DatePicker(selection : $date){
                    Text("Geburtstag")
                }
                
                Picker("Geschlecht",selection: $genderChoice){
                    ForEach(0 ..< settings.count){
                        index in
                        Text(settings[index]).tag(index)
                    }
                    
                }
                
                Section("Profileinstellungen"){
                    
                    ColorPicker("Wähle hier deine Farbe",
                                selection: $yourColor)
                    
                    Toggle(isOn: $darkModus){
                        Text("Dark Modus")
                        if(darkModus){
                        }else{
                        }
                    }
                    
                    
                    Toggle(isOn: $leseModus) {
                        Text("Lese Modus")
                        if(leseModus){
                        }else{
                        }
                    }
                    
                    Toggle(isOn: $schrift) {
                        Text("Schriftgröße ändern")
                        if(schrift) {
                        }
                    }
                    
                }
                
            }
            
        
        }
      //  .background(Color.green)
        .offset(x: 5, y: 2)
        .cornerRadius(50)
        
    }
        
        
            
            struct UserProfil_Previews: PreviewProvider {
                static var previews: some View {
                    UserProfil()
                }
            }
        }
        
    
