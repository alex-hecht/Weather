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
        //creates Zstack to make a background for view
        ZStack{
            //creates image background from assets
            Image("sky")
            Spacer()
            //Creates Vstack that stores picture
            VStack{
                if let test = hour.condition.icon{
                    KFImage(URL(string: "https:" + test))
                        .resizable()
                        .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                        .padding()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 400)
                    
                    
                    
                    
                    
                    Spacer()
                    
                    
                }
                else{
                    // shows error image if it doesn't work
                    Image("download")
                    
                    
                    
                    
                }
                
            }
            //creates separate Vstack for data
            VStack{
                Text(hour.time ?? "Time not Found" )
                    .font(.title)
                    .multilineTextAlignment(.leading)
                HStack{
                    Text( "Temperature")
                        .font(.title)
                        .multilineTextAlignment(.leading)
                    
                    Text(String(hour.temp_f ?? 0.0) +  " F")
                        .font(.title)
                        .multilineTextAlignment(.trailing)
                }
                HStack{
                    Text( "Chance of Snow: ")
                        .font(.title)
                        .multilineTextAlignment(.leading)
                    Text( String(hour.chance_of_snow ?? 0.0)  + "%")
                        .font(.title)
                        .multilineTextAlignment(.trailing)
                }
                HStack{
                    Text("Chance of Rain")
                        .font(.title)
                        .multilineTextAlignment(.leading)
                    Text( String(hour.chance_of_rain ?? 0.0) + "%")
                        .font(.title)
                        .multilineTextAlignment(.trailing)
                }
                HStack{
                    Text( "Real Feel: ")
                        .font(.title)
                        .multilineTextAlignment(.leading)
                    Text(String(hour.feelslike_f ?? 0.0) + " F")
                        .font(.title)
                        .multilineTextAlignment(.trailing)
                }
               
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
