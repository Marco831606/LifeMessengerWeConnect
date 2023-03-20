//
//  AddTaskView.swift
//  LifeMessengerWeConnect
//
//  Created by Marco Molisano on 20.03.23.
//

import SwiftUI

struct AddTaskView: View {
    
    var addNew: (Task) ->()
    
    @Environment(\.dismiss) private var dismiss
    @State private var taskName: String = ""
    @State private var taskDescription: String = ""
    @State private var taskDate: Date = .init()
    @State private var taskCategory: Category = .Termine
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 10) {
                Button{
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                        .contentShape(Rectangle())
                }
                
                Text("Neuen Termin Eintragen")
                    .nSans(26, .light)
                    .foregroundColor(.white)
                    .padding(.vertical,15)
                
                TitleView("Geschäftstermin")
                TextField("Termin mit Herr Muster am 03.06.2023", text: $taskName)
                    .nSans(15, .regular)
                    .foregroundColor(.white)
                    .padding(.vertical,15)
                
            }
            .hAlign(.leading)
            .padding(15)
            .background {
                taskCategory.color
                    .ignoresSafeArea()
            }
        }
        
        .vAlign(.top)
        
    }
    
    @ViewBuilder
    func TitleView(_ value: String) -> some View {
        Text(value)
            .nSans(12, .regular)
            .foregroundColor(.white.opacity(0.7))
    }
}
    
    
    struct AddTaskView_Previews: PreviewProvider {
        static var previews: some View {
            AddTaskView { task in
                
            }
        }
    }

