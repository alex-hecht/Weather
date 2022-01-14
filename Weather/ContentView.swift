//
//  ContentView.swift
//  Weather
//
//  Created by Alexander Hecht (student LM) on 1/4/22.
//

import SwiftUI
import struct Kingfisher.KFImage
struct ContentView: View {
    
    @StateObject var fetchData = FetchData()
    
    var body: some View {
        List(fetchData.forecastDay.hour){ hour in
            HStack{
                KFImage(hour.condition.icon)
                VStack{
                    Text(fetchData.responses.location.name ?? "Location not found" )
                    Text(fetchData.responses.forecast.forecastday[0].date ?? "Date not found" )
                }
            }
            
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
