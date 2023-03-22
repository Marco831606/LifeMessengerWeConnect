//
//  OrganizerView.swift
//  LifeMessengerWeConnect
//
//  Created by Marco Molisano on 22.02.23.
//

import SwiftUI

struct OrganizerView: View {
    
    @State private var currentDay: Date = .init()
    @State private var tasks: [Task] = OrganizerTasks
    @State private var addNewTask: Bool = false
    
    var body: some View {
       
        
        ScrollView(.vertical, showsIndicators: false) {
            TimelineView()
            
            
        }
        .safeAreaInset(edge: .top, spacing: 0) {
            HeaderView()
        }
        .fullScreenCover(isPresented: $addNewTask) {
            AddTaskView { task in
                
                tasks.append(task)
                
            }
            
        }
    }
    @ViewBuilder
    func TimelineView() -> some View {
        ScrollViewReader { proxy in
            let hours = Calendar.current.hours
            let midHour = hours[hours.count / 2]
            VStack{
                ForEach(hours, id: \.self) { hour in
                    TimelineViewRow(hour)
                        .id(hour)
                }
            }
            .onAppear {
                proxy.scrollTo(midHour)
            }
        }
        
    }
    
    @ViewBuilder
    func TimelineViewRow(_ date: Date) -> some View {
        HStack(alignment: .top) {
            Text(date.toString("h a"))
                .nSans(14, .regular)
                .frame(width: 45, alignment: .leading)
        }
        .hAlign(.leading)
        .padding(.vertical,15)
    
            
            let calendar = Calendar.current
            let filteredTask = tasks.filter {
                if let hour = calendar.dateComponents([.hour], from: date).hour,
                   let taskHour = calendar.dateComponents([.hour], from:
                   $0.dateAdded).hour,
                hour == taskHour && calendar.isDate($0.dateAdded, inSameDayAs: currentDay) {
                    return true
                    
                }
                return false
            }
            
            if filteredTask.isEmpty{
                Rectangle()
                    .stroke(.gray.opacity(0.5), style: StrokeStyle(lineWidth: 0.5, lineCap: .butt, lineJoin: .bevel, dash: [5], dashPhase: 5))
                    .frame(height: 0.5)
                    .offset(y: 10)
            }else{
                
                VStack(spacing: 10) {
                    ForEach(filteredTask) { task in
                        TaskRow(task)
                    }
                    
                }
                
            }
        }
    
    
    @ViewBuilder
    func TaskRow(_ task: Task) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(task.taskName.uppercased())
                .nSans(16, .regular)
                .foregroundColor(task.taskCategory.color)
            if task.taskDescription != "" {
                Text(task.taskDescription)
                    .nSans(14, .light)
                foregroundColor(task.taskCategory.color.opacity(0.8))
            }
        }
            .hAlign(.leading)
            .padding(12)
            .background {
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(task.taskCategory.color)
                        .frame(width: 4)
                    
                    Rectangle()
                        .fill(task.taskCategory.color.opacity(0.25))
                }
            }
        }
    
    @ViewBuilder
    func HeaderView() -> some View{
        VStack{
        
            HStack{
                VStack(alignment: .leading, spacing: 5) {
                    Text("Terminkalender")
                        .font(.title)
                        .foregroundColor(Color.black)
                    
                    Text("Herzlich Willkommen")
                        .foregroundColor(Color.black)
                        .padding(1)
                    
                    
                    
                    
                }
                Spacer()
                
                Button {
                    addNewTask.toggle()
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
            
            
            Text(Date().toString("MMM YYY"))
                .padding(15)
                .offset(x: -140)
            
            WeekRow()
            
            }
            .padding(15)
            .background {
                VStack(spacing: 0) {
                    Color.white
                    Rectangle()
                        .fill(.linearGradient(colors:[.white,.clear], startPoint: .top, endPoint: .bottom))
                        .frame(height: 20)
                        
                }
                .ignoresSafeArea()
            }
        }
        
    @ViewBuilder
    func WeekRow() -> some View{
        HStack(spacing: 0) {
            ForEach(Calendar.current.currentWeek){ weekDay in
                let status = Calendar.current.isDate(weekDay.date, inSameDayAs: currentDay)
                VStack(spacing: 6) {
                    Text(weekDay.string.prefix(3))
                        .nSans(12, .medium)
                    Text(weekDay.date.toString("dd"))
                        .nSans(16, status ? .medium : .regular)
                    }
            
                    .hAlign(.center)
                    .foregroundColor(status ? Color("Red") : .gray)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            currentDay = weekDay.date
                        }
                    }
                }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, -15)
    }
    
    }
            

    


struct OrganizerView_Previews: PreviewProvider {
    static var previews: some View {
        OrganizerView()
    }
}

extension View {
    func hAlign(_ alignment: Alignment) -> some View {
        self.frame(maxWidth: .infinity,alignment: alignment)
    }
    
    func vAlign(_ alignment: Alignment) -> some View {
        self.frame(maxHeight: .infinity,alignment: alignment)
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
    
    var hours: [Date] {
        let startOfDay = self.startOfDay(for: Date())
        var hours: [Date] = []
        for index in 0..<24{
            if let date = self.date(byAdding: .hour, value: index, to: startOfDay){
                hours.append(date)
            }
        }
        return hours
    }
    var currentWeek: [WeekDay] {
        guard let firstWeekday = self.dateInterval(of: .weekOfMonth, for: Date())?.start
        else{return[]}
        var week: [WeekDay] = []
        for index in 0..<7{
            if let day = self.date(byAdding: .day, value: index, to: firstWeekday){
                let weekDaySymbol: String = day.toString("EEEE")
                let isToday = self.isDateInToday(day)
                week.append(.init(string: weekDaySymbol, date: day, isToday: isToday))
            }
        }
        
        return week
    }
}
