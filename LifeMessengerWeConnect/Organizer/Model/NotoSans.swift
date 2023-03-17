//
//  NotoSans.swift
//  LifeMessengerWeConnect
//
//  Created by Marco Molisano on 14.03.23.
//

import SwiftUI

enum NotoSans{
    case light
    case bold
    case medium
    case regular
    
    var weight: Font.Weight{
        switch self {
        case .light:
            return .light
        case.bold:
            return .bold
        case.medium:
            return .medium
        case.regular:
            return .regular
        }
    }
}

extension View{
    func nSans(_ size: CGFloat, _ weight: NotoSans) -> some View{
        self
            .font(.custom("NotoSans", size: size))
            .fontWeight(weight.weight)
    }
}
