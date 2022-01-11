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
        List(fetchData.responses.forecast){forecast in
            
            forecast
            HStack{
                
                
                
                
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
