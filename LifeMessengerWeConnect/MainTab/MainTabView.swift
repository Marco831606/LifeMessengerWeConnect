//
//  MainTabView.swift
//  LifeMessengerWeConnect
//
//  Created by Marco Molisano on 02.03.23.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectionIndex = 0
    
    var body: some View {
        
        TabView(selection: $selectionIndex) {
        
            
            ExplorerView()
                .onTapGesture {
                    self.selectionIndex = 0
                }
                .tabItem {
                    Image(systemName: "message")
                }.tag(0)
            
            OrganizerView()
                .onTapGesture {
                    self.selectionIndex = 1
                }
                .tabItem {
                    Image(systemName: "folder.badge.person.crop")
                }.tag(1)
            
            AlbumListView()
                .onTapGesture {
                    self.selectionIndex = 2
                }
                .tabItem {
                    Image(systemName: "party.popper")
                }.tag(2)
            
            PictureAndVideoGalerieView()
                .onTapGesture {
                    self.selectionIndex = 3
                }
                .tabItem {
                    Image(systemName: "camera")
                }.tag(3)
            
            UserProfil()
                .onTapGesture {
                    self.selectionIndex = 4
                }
                .tabItem {
                    Image(systemName: "gearshape")
                }.tag(4)
            
        }
        
    }
    
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
