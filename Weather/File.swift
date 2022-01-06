//
//  File.swift
//  Weather
//
//  Created by Adam Lee (student LM) on 1/5/22.
//

import Foundation

class FetchData:ObservableObject{
    @Published var responses = Response()
    
    init(){
        guard let url = URL(string: "https://api.weatherapi.com/v1/forecast.json?key=28489f27d259492e978173941220401&q=Philadelphia&days=7&aqi=no&alerts=no") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, errors) in
            guard let data = data else {return}
            
            let decoder = JSONDecoder()
            if let response = try? decoder.decode(Response.self, from: data) {
                DispatchQueue.main.async {
                    self.responses = response
                }
            }
            
            
        }.resume()
    }
    
}

struct Response: Codable{
    var totalResults : Int = 0
    var forecast : [Forecast] = [Forecast]()
    
}

struct Forecast : Codable{
    var date : String?
    var day  : [Day] = [Day]()
   
}

struct Day : Codable{
    var maxtemp_f : Double?
    var mintemp_f : Double?
    var avgtemp_f : Double?
    var totalprecip_in : Double?
    var avghumidity : Double?
    var daily_will_it_snow : Int?
    var daily_chance_of_snow : Int?
    var icon : URL?
}



// add an extension to the article struct so that we can use an array of articles
// to dynamically create List.
extension Forecast: Identifiable{
    var id: String {return date!}
}


