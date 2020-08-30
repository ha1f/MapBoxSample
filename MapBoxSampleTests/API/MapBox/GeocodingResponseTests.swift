//
//  GeocodingResponseTests.swift
//  MapBoxSampleTests
//
//  Created by ha1f on 2020/08/30.
//  Copyright © 2020 ha1f. All rights reserved.
//

import XCTest
@testable import MapBoxSample

class GeocodingResponseTests: XCTestCase {
    func testDecode() {
        let exampleJSONString = """
{
"type": "FeatureCollection",
"query": [
    "market",
    "street",
    "and",
    "fremont",
    "street"
],
"features": [
    {
        "id": "address.8797576262039554",
        "type": "Feature",
        "place_type": [
            "address"
        ],
        "relevance": 1,
        "properties": {
            "accuracy": "intersection"
        },
        "text": "Fremont Street",
        "place_name": "Market Street and Fremont Street, San Francisco, California 94105, United States",
        "center": [
            -122.3982976,
            37.791734
        ],
        "geometry": {
            "type": "Point",
            "coordinates": [
                -122.3982976,
                37.791734
            ]
        },
        "context": [
            {
                "id": "neighborhood.293324",
                "text": "South Beach"
            },
            {
                "id": "postcode.17577055718678700",
                "text": "94105"
            },
            {
                "id": "place.15734669613361910",
                "wikidata": "Q62",
                "text": "San Francisco"
            },
            {
                "id": "region.11319063928738010",
                "short_code": "US-CA",
                "wikidata": "Q99",
                "text": "California"
            },
            {
                "id": "country.9053006287256050",
                "short_code": "us",
                "wikidata": "Q30",
                "text": "United States"
            }
        ]
    }
]
}
"""
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let decoded = try decoder.decode(GeocodingResponse.self, from: exampleJSONString.data(using: .utf8)!)
            XCTAssertEqual(decoded.type, "FeatureCollection")
        } catch {
            print(error)
            XCTFail(error.localizedDescription)
        }
    }
}
