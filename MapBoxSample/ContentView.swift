//
//  ContentView.swift
//  MapBoxSample
//
//  Created by ha1f on 2020/08/29.
//  Copyright © 2020 ha1f. All rights reserved.
//

import SwiftUI
import Mapbox

private extension MGLPointAnnotation {
    convenience init(title: String, coordinate: CLLocationCoordinate2D) {
        self.init()
        self.title = title
        self.coordinate = coordinate
    }
}

/// annotationと中心座標が近すぎると何故か触ったときにクラッシュするので、適当に離してある
struct ContentView: View {
    @State var annotations: [MGLPointAnnotation] = [
        MGLPointAnnotation(title: "Mazzone", coordinate: .init(latitude: 33.594115, longitude: 130.418308))
    ]

    var body: some View {
        NavigationView {
            MapView(annotations: $annotations)
                .centerCoordinate(.init(latitude: 33.590507, longitude: 130.430142))
                .zoomLevel(16)
                .navigationBarTitle("Map")
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
