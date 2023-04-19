//
//  TaskCategory.swift
//  OrganizerTestApp
//
//  Created by Marco Molisano on 16.03.23.
//

import Foundation
import SwiftUI

enum Category: String,CaseIterable{
    case Schule = "Schule"
    case Freizeit = "Freizeit"
    case Termine = "Termine"
    case Urlaub = "Urlaub"
    case Finanzen = "Finanzen"
    case Tagebuch = "Tagebuch"
    
    var color: Color{
        switch self {
        case .Schule:
            return Color("Skyblue")
        case .Freizeit:
            return Color("Red")
        case .Termine:
            return Color("MBlue")
        case .Urlaub:
            return Color("Orange")
        case .Finanzen:
            return Color("Lila")
        case.Tagebuch:
            return Color("Green")
            
            
            
 
   
        }
    }
}
