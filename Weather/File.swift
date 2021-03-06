//
//  File.swift
//  Weather
//
//  Created by Adam Lee (student LM) on 1/5/22.
//

import Foundation

class FetchData: ObservableObject{
    @Published var responses : Response = Response()
    @Published var forecastDay : ForecastDay = ForecastDay()
    
    
    init(){
        guard let url = URL(string: "https://api.weatherapi.com/v1/forecast.json?key=28489f27d259492e978173941220401&q=Philadelphia&days=1&aqi=no&alerts=no") else {return}

        URLSession.shared.dataTask(with: url) { (data, response, errors) in
            guard let data = data else {return}
            
            guard let dataAsString = String(data:data, encoding: .utf8) else {return}
            
            print(dataAsString)
            let decoder = JSONDecoder()
            if let response = try? decoder.decode(Response.self, from: data) {
                DispatchQueue.main.async {
                    self.responses = response
                    self.forecastDay = response.forecast.forecastday[0]
                }
            }
            else{
                print("no data")
            }
            
        }.resume()
    }
    
}
//declaring individual class Response that includes all other variables including weather information
struct Response: Codable{
    var location : Location = Location()
    var forecast : Forecast = Forecast()
}
//declaring class named Location that is included in Response that includes 3 vairables chosen by us, Name, region, and country
struct Location : Codable{
    var name : String?
    var region : String?
    var country : String?
}
//declaring class Forecast creates a list of objects
struct Forecast : Codable{
    var forecastday : [ForecastDay] = [ForecastDay]()
    
}
//declaring class forecastday includes 2 variables chosen by us for the project date and hour.
struct ForecastDay : Codable{
    var date : String?
    var hour : [Hour] = [Hour]()
    
}

struct Hour : Codable{
    var condition : Condition
    var time : String?
    var temp_f : Double? = 0
    var chance_of_snow : Double? = 0
    var chance_of_rain : Double? = 0
    var feelslike_f : Double? = 0
   
}

struct Condition : Codable {
    var icon : String?
}


// add an extension to the article struct so that we can use an array of articles
// to dynamically create List.
extension Hour: Identifiable{
    var id: String {return time!}
}


