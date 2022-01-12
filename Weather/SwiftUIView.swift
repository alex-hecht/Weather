//
//  SwiftUIView.swift
//  Weather
//
//  Created by Adam Lee (student LM) on 1/7/22.
//

import SwiftUI

struct SwiftUIView: View {
    
    @StateObject var fetchData = FetchData()
    
    var body: some View {
        Text("Hello World")
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
