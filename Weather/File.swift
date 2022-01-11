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
        guard let url = URL(string: "http://api.weatherapi.com/v1/forecast.json?key=28489f27d259492e978173941220401&q=Philadelphia&days=1&aqi=no&alerts=no") else {return}

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
//Calling individual variable Response that incl
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
    var hour : [Hour] = [Hour]()
    
}

struct Hour : Codable{
    var condition : Condition
    var time : String?
    var temp_f : Double?
    var chance_of_snow : Double?
    var chance_of_rain : Double?
    var feelslike_f : Double?
}

struct Condition : Codable {
    var icon : URL?
}


// add an extension to the article struct so that we can use an array of articles
// to dynamically create List.
extension ForecastDay: Identifiable{
    var id: String {return date!}
}


