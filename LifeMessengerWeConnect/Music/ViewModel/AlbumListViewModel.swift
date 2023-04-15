//
//  Event.swift
//  LifeMessengerWeConnect
//
//  Created by Marco Molisano on 23.03.23.
//
import Combine
import Foundation
import SwiftUI

//https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=8
//https://itunes.apple.com/search?term=jack+johnson&entity=song
//https://itunes.apple.com/search?term=jack+johnson&entity=movie


class AlbumListViewModel: ObservableObject {
    
    @Published var searchTerm: String = ""
    @Published var albums: [Album] = [Album]()
    
    let limit: Int = 100
    
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        
        $searchTerm.sink { [weak self] term in
            self?.fetchAlbums(for: term)
        }.store(in: &subscriptions)
    }
    
    func fetchAlbums(for searchTerm: String) {
        
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(searchTerm)&entity=album&limit=\(limit)") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("urlsession error: \(error.localizedDescription)")
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(AlbumResult.self, from: data)
                    DispatchQueue.main.async {
                        self.albums = result.results
                    }
                    
                } catch {
                    print("decoding error \(error)")
                }
                
            }
            
        }.resume()
        
    }
    
    
    
}


 
