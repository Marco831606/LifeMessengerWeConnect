//
//  TaskModel.swift
//  OrganizerTestApp
//
//  Created by Marco Molisano on 16.03.23.
//

import Foundation

struct Task: Identifiable{
    var id: UUID = .init()
    var dateAdded: Date
    var taskName: String
    var taskDescription: String
    var taskCategory: Category
}

var OrganizerTasks: [Task] = [
    .init(dateAdded: Date(timeIntervalSince1970: 1672829809), taskName:"Deutsch" , taskDescription: "", taskCategory: .Schule),
    .init(dateAdded: Date(timeIntervalSince1970: 1672833409), taskName:"Mathe", taskDescription: "", taskCategory: .Freizeit),
    .init(dateAdded: Date(timeIntervalSince1970: 1672833409), taskName:"Englisch", taskDescription: "", taskCategory: .Termine),
    .init(dateAdded: Date(timeIntervalSince1970: 1672833409), taskName:"Bio", taskDescription: "", taskCategory: .Urlaub),
    .init(dateAdded: Date(timeIntervalSince1970: 1672833409), taskName:"Physik", taskDescription: "", taskCategory: .Finanzen),
    .init(dateAdded: Date(timeIntervalSince1970: 1672833409), taskName:"Geschichte", taskDescription: "", taskCategory: .Freizeit),
    .init(dateAdded: Date(timeIntervalSince1970: 1672833409), taskName:"Erdkunde", taskDescription: "", taskCategory: .Schule),
    .init(dateAdded: Date(timeIntervalSince1970: 1672833409), taskName:"Kunst", taskDescription: "", taskCategory: .Freizeit),
    .init(dateAdded: Date(timeIntervalSince1970: 1672833409), taskName:"Sport", taskDescription: "", taskCategory: .Urlaub),
]

