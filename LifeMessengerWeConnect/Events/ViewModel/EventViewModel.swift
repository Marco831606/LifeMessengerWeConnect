//
//  Event.swift
//  LifeMessengerWeConnect
//
//  Created by Marco Molisano on 23.03.23.
//

import Foundation

@MainActor class EventViewModel: ObservableObject{
    
    @Published var eventData: String = ""
    
    init(){
        fetchEvents(completion: { eventData in
            self.eventData = eventData.artist ?? ""
            self.eventData = eventData.location ?? ""
            self.eventData = eventData.events ?? ""
        })
    }
    
    let baseUrl = ""
    
    func fetchEvents(completion: @escaping(EventData) -> Void){
        
        // 1.url
        
        let url = URL(string: baseUrl + "")
        guard url != nil else {return}
        
        // 2.session
        
        let session = URLSession.shared
        
        // 3.datatask
        
        let dataTask = session.dataTask(with: url!){data, response, error in
            if error == nil && data != nil{
                let decoder = JSONDecoder()
                
                do{
                    let eventData = try decoder.decode(EventData.self, from: data!)
                    DispatchQueue.main.async {
                        completion(eventData)
                    }
                } catch let error {
                    print("Error parsing json")
                    print(error)
                }
            }
        }
        
        // 4. call API
        dataTask.resume()
    }
}
