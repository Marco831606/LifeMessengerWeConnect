//
//  PictureAndVideoGalerieView.swift
//  LifeMessengerWeConnect
//
//  Created by Marco Molisano on 02.03.23.
//
import PhotosUI
import SwiftUI

struct PictureAndVideoGalerieView: View {
    @State var selectedItems: [PhotosPickerItem] = []
    @State var data: Data?
    
    var body: some View {
        VStack{
            Text("Foto Galerie")
            Image("Messenger")
                .resizable()
                .frame(width: 130, height: 140 )
                .cornerRadius(50)
            if let data = data, let uiimage = UIImage(data: data) {
                Image(uiImage: uiimage)
                    .resizable()
            }
        
            Spacer()
            PhotosPicker(selection: $selectedItems,
                         matching: .images) {
                Text("Foto auswählen")
                
            }
                         .background(Color.white)
                         .shadow(radius: 5)
                         .frame(width: 300, height: 30)
                         .padding(20)
                         .onChange(of: selectedItems) { newValue in
                             guard let item = selectedItems.first else {
                                 return
                             }
                             item.loadTransferable(type: Data.self) { result in
                                 switch result {
                                 case .success(let data):
                                     if let data = data {
                                         self.data = data
                                         
                                     } else {
                                         print("No Data")
                                     }
                                 case .failure(let failure):
                                     fatalError("\(failure)")
                        
                                 }
                             }
                         }
                     }
               }
            }
                         


struct PictureAndVideoGalerieView_Previews: PreviewProvider {
    static var previews: some View {
        PictureAndVideoGalerieView()
    }
}
