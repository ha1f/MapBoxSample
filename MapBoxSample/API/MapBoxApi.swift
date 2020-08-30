//
//  MapBoxApi.swift
//  MapBoxSample
//
//  Created by ha1f on 2020/08/30.
//  Copyright © 2020 ha1f. All rights reserved.
//

import Foundation

extension ApiClient {
    static var mapBoxGeocoding: ApiClient {
        ApiClient(baseURL: URL(string: "https://api.mapbox.com/geocoding/v5")!)
    }
}

struct GeocodingRequest {

}
