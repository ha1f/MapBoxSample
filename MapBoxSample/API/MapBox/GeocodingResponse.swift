//
//  GeocodingResponse.swift
//  MapBoxSample
//
//  Created by ha1f on 2020/08/30.
//  Copyright © 2020 ha1f. All rights reserved.
//

import Foundation

/// https://docs.mapbox.com/api/search/#geocoding-response-object
/// 現状text_{language}, place_name_{language}, language_{language}が扱えないのであとでどうにかする
struct GeocodingResponse: Decodable {
    /// "FeatureCollection", a GeoJSON type from the [GeoJSON specification](https://tools.ietf.org/html/rfc7946).
    var type: String
    var query: [String]
    var features: [Feature]
    var attribution: String?
}

extension GeocodingResponse {
    struct Feature: Decodable {
        var id: String

        /// "Feature"
        var type: String

        /// An array of feature types describing the feature.
        /// Options are country, region, postcode, district, place, locality, neighborhood, address, and poi
        var placeType: [String]


        /// https://github.com/mapbox/MapboxGeocoder.swift/blob/3ebddd4ba7375fcbd760d38711bba2570215e77b/MapboxGeocoder/MBPlacemark.swift#L456
        var relevance: Double

        /// A string of the house number for the returned address feature. Note that unlike the address property for poi features, this property is outside the properties object.
        var address: String?

        var properties: Properties

        /// A string representing the feature in the requested language, if specified.
        var text: String

        /// A string representing the feature in the requested language, if specified, and its full result hierarchy.
        var placeName: String

        var matchingText: String?

        var matchingPlaceName: String?

        /// A string of the IETF language tag of the query’s primary language.
        var language: String?

        /// A bounding box array in the form [minX,minY,maxX,maxY].
        var bbox: [Double]?

        var center: [Double]

        var geometry: Geometry

        /// これがほんとにvalueもStringでいいのか自信がない
        var context: [[String: String]]

        /// An object with the routable points for the feature.
        var routable_points: RoutablePoints?
    }
}

extension GeocodingResponse.Feature {
    struct Properties: Decodable {
        var accuracy: String?
        var category: String?
        /// https://labs.mapbox.com/maki-icons/
        var maki: String?
        var landmark: Bool?
        var wikidata: String?
        /// The ISO 3166-1 country and ISO 3166-2 region code for the returned feature.
        var shortCode: String?
        /// deprecated.
        /// A formatted string of the telephone number for the returned poi feature.
        var tel: String?
    }

    struct Geometry: Decodable {
        /// "Point"
        var type: String

        /// An array in the format [longitude,latitude] at the center of the specified bbox.
        var coordinates: [Double]

        var interpolated: Bool?

        var omitted: Bool?
    }

    struct RoutablePoints: Decodable {
        /// An array of points in the form of [{ coordinates: [lon, lat] }], or null if no points were found.
        var points: [RoutablePoint]?
    }

    struct RoutablePoint: Decodable {
        var coordinates: [Double]
    }
}


//{
//    "type": "FeatureCollection",
//    "query": [
//        "market",
//        "street",
//        "and",
//        "fremont",
//        "street"
//    ],
//    "features": [
//        {
//            "id": "address.8797576262039554",
//            "type": "Feature",
//            "place_type": [
//                "address"
//            ],
//            "relevance": 1,
//            "properties": {
//                "accuracy": "intersection"
//            },
//            "text": "Fremont Street",
//            "place_name": "Market Street and Fremont Street, San Francisco, California 94105, United States",
//            "center": [
//                -122.3982976,
//                37.791734
//            ],
//            "geometry": {
//                "type": "Point",
//                "coordinates": [
//                    -122.3982976,
//                    37.791734
//                ]
//            },
//            "context": [
//                {
//                    "id": "neighborhood.293324",
//                    "text": "South Beach"
//                },
//                {
//                    "id": "postcode.17577055718678700",
//                    "text": "94105"
//                },
//                {
//                    "id": "place.15734669613361910",
//                    "wikidata": "Q62",
//                    "text": "San Francisco"
//                },
//                {
//                    "id": "region.11319063928738010",
//                    "short_code": "US-CA",
//                    "wikidata": "Q99",
//                    "text": "California"
//                },
//                {
//                    "id": "country.9053006287256050",
//                    "short_code": "us",
//                    "wikidata": "Q30",
//                    "text": "United States"
//                }
//            ]
//        }
//    ]
//}

