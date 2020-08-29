//
//  MapView.swift
//  MapBoxSample
//
//  Created by ha1f on 2020/08/29.
//  Copyright © 2020 ha1f. All rights reserved.
//

import SwiftUI
import Mapbox

struct MapView: UIViewRepresentable {
    private let mapView: MGLMapView

    init(styleURL: URL? = MGLStyle.streetsStyleURL) {
        mapView = MGLMapView(frame: .zero, styleURL: styleURL)
    }

    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MGLMapView {
        return mapView
    }

    func updateUIView(_ uiView: MGLMapView, context: UIViewRepresentableContext<MapView>) {
        //
    }

    func centerCoordinate(_ centerCoordinate: CLLocationCoordinate2D) -> MapView {
        mapView.centerCoordinate = centerCoordinate
        return self
    }

    func zoomLevel(_ zoomLevel: Double) -> MapView {
        mapView.zoomLevel = zoomLevel
        return self
    }
}
