//
//  EventView.swift
//  LifeMessengerWeConnect
//
//  Created by Marco Molisano on 02.03.23.
//

import SwiftUI

struct EventView: View {
    
    @StateObject var viewModel = EventViewModel()
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: viewModel.eventData ?? ""))
            Text("Events")
            Image(systemName: "party.popper")
                .imageScale(.large)
                .foregroundColor(.green)
        }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
    }
}
