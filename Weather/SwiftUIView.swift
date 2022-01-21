//
//  SwiftUIView.swift
//  Weather
//
//  Created by Adam Lee (student LM) on 1/7/22.
//

import SwiftUI
import struct Kingfisher.KFImage
struct SwiftUIView: View {
    
    var hour : Hour
    
    var body: some View {
        ZStack{
            
            Image("sky")
            Spacer()
            VStack{
                if let test = hour.condition.icon{
                    KFImage(URL(string: "https:" + test))
                        .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                    Spacer()
                    
                    
                }
                else{
                 
                    Image("download")
                    
                    
                    
                    
                }
                Text(hour.time ?? "Time not Found" )
                    .font(.title)
                    .multilineTextAlignment(.leading)
                Text( "Temperature " + String(hour.temp_f ?? 0.0) +  " degrees F")
                    .font(.title)
                    .multilineTextAlignment(.leading)
                Text( "Chance of Snow " + String(hour.chance_of_snow ?? 0.0)  + "%")
                    .font(.title)
                    .multilineTextAlignment(.leading)
                Text( "Chance of Rain " + String(hour.chance_of_rain ?? 0.0) + "%")
                    .font(.title)
                    .multilineTextAlignment(.leading)
                Text( "Real Feel " + String(hour.feelslike_f ?? 0.0) + "degrees F")
                    .font(.title)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView(hour:(Hour(condition: Condition(icon:"https://cdn.weatherapi.com/weather/64x64/night/116.png"), time: "0", temp_f: 0, chance_of_snow: 0, chance_of_rain: 0, feelslike_f: 0)))
        
    }
}
