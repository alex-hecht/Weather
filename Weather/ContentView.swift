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
        NavigationView{
            List(fetchData.forecastDay.hour){ hour in
                NavigationLink(
                    destination: SwiftUIView(hour : hour),
                    label: {
                        HStack{
                            if let test = hour.condition.icon{
                                KFImage(URL(string: "https:" + test))
                            }
                            else{
                                Image("download")
                            }
                            VStack{
                                Text(fetchData.responses.location.name ?? "Location not found" )
                                Text(hour.time ?? "Date not found" )
                            }
                        }
                        
                    }
                    
                    
                    
                )
                
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
