//
//  SwiftUIView.swift
//  Weather
//
//  Created by Adam Lee (student LM) on 1/7/22.
//

import SwiftUI

struct SwiftUIView: View {
    
    
    @StateObject var fetchData = FetchData()
    var hour1 : Hour
    var body: some View {
       Text("III")
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView(hour1: Hour())
    }
}
