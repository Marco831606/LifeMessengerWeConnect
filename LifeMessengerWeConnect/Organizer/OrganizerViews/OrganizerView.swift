//
//  OrganizerView.swift
//  LifeMessengerWeConnect
//
//  Created by Marco Molisano on 22.02.23.
//

import SwiftUI

struct OrganizerView: View {
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
        }
        .safeAreaInset(edge: .top, spacing: 0) {
            HeaderView()
            
        }
    }
    
    @ViewBuilder
    func HeaderView() -> some View{
        VStack{
            Image("Messenger2")
        
                .frame(width: 150, height: 150)
                .padding(100)
                .clipShape(Capsule())
                .background(Color.blue)
                .cornerRadius(25)
            HStack{
                VStack(alignment: .leading, spacing: 5) {
                    Text("Terminkalender")
                        .font(.title)
                        .foregroundColor(Color.black)
                        
                    Text("Herzlich Willkommen")
                        .foregroundColor(Color.black)
                        .padding(1)
                    
                    Text(Date().toString("MMM YYY"))
                        .padding(.top, 15)
                    
                    
                }
                Spacer()
                
                Button {
                } label: {
                    HStack(spacing: 10) {
                        Image(systemName: "plus")
                        Text("Hinzufügen")
                            .foregroundColor(.white)
                
                        
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    
                
                }
                
            }
            .padding()
        }
        
    }
}
        
    


struct OrganizerView_Previews: PreviewProvider {
    static var previews: some View {
        OrganizerView()
    }
}

extension Date{
    func toString(_ format: String) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
        
    }
}

extension Calendar{
    var currentWeek: [WeekDay] {
        guard let firstWeekday = self.dateInterval(of: .weekOfMonth, for: Date())?.start
        else{return[]}
        var week: [WeekDay] = []
        for index in 0..<7{
            if let day = self.date(byAdding: .day, value: index, to: firstWeekday){
                let weekDaySymbol: String = day.toString("EEEE")
                let isToday = self.isDateInToday(day)
                week.append(.init(string: weekDaySymbol, date: day))
            }
        }
        
        return week
    }
}
