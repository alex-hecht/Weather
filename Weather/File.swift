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
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=migraine+headache&from=2021-12-05&sortBy=publishedAt&apiKey=0f56280d7a164be692d2371c668c569c") else {return}
        
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
    var articles : [Article] = [Article]()
    
}

struct Article : Codable{
    var title : String?
    var url  : URL?
    var urlToImage : URL?
}



// add an extension to the article struct so that we can use an array of articles
// to dynamically create List.
extension Article: Identifiable{
    var id: String {return title!}
}


