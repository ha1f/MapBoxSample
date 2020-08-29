//
//  ContentView.swift
//  MapBoxSample
//
//  Created by ha1f on 2020/08/29.
//  Copyright © 2020 ha1f. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            MapView()
                .centerCoordinate(.init(latitude: 37.791293, longitude: -122.396324))
                .zoomLevel(16)
                .navigationBarTitle("Map")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
