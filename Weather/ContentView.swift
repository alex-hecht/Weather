//
//  ContentView.swift
//  Weather
//
//  Created by Alexander Hecht (student LM) on 1/4/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var fetchData = FetchData()
    
    var body: some View {
        List(fetchData.responses.forecast){forecast in
            
            HStack{
                Text(forecast.date ?? "File not Found" )
                
            }
            
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
