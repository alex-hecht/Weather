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
        
        //Creates a navigation view
        NavigationView{
            //Creates list of hour objects
            List(fetchData.forecastDay.hour){ hour in
                //Creates a navigation link with a destination and label
                NavigationLink(
                    destination: SwiftUIView(hour : hour),
                    label: {
                        
                        ZStack{
                               
                            //creates Hstack to house the image, date, and location objects
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
                        
                    }
                    
                    
                    
                )
                //creates title to appear at top of the main view
            }.navigationTitle("Liberty Weather")
            
            
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
