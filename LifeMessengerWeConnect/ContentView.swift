//
//  ContentView.swift
//  LifeMessengerWeConnect
//
//  Created by Marco Molisano on 19.02.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Search")
                .padding()
            AlbumListView()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    

