//
//  File.swift
//  Weather
//
//  Created by Adam Lee (student LM) on 1/5/22.
//

import Foundation

class FetchData: ObservableObject{
    @Published var responses : Response = Response()
    
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
    var location : Location = Location()
    var forecast : Forecast = Forecast()
}
struct Location : Codable{
    var name : String?
    var region : String?
    var country : String?
}
struct Forecast : Codable{
    var forecastday  : [ForecastDay] = [ForecastDay]()
    
}

struct ForecastDay : Codable{
    var date : String?
    var day : Day
    
}

struct Day : Codable{
    var condition : Condition
}

struct Condition : Codable {
    var icon : String?
}


// add an extension to the article struct so that we can use an array of articles
// to dynamically create List.
extension ForecastDay: Identifiable{
    var id: String {return date!}
}


