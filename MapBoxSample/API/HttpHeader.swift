//
//  HttpHeader.swift
//  MapBoxSample
//
//  Created by ha1f on 2020/08/30.
//  Copyright © 2020 ha1f. All rights reserved.
//

import Foundation

struct HttpHeader {
    var fieldName: String
    var value: String

    static func userAgent(_ value: String) -> HttpHeader {
        HttpHeader(fieldName: "User-Agent", value: value)
    }

    static func acceptLanguage(_ value: String) -> HttpHeader {
        HttpHeader(fieldName: "Accept-Language", value: value)
    }

    static func accept(_ value: String) -> HttpHeader {
        HttpHeader(fieldName: "Accept", value: value)
    }

    static func ifModifiedSince(_ value: String) -> HttpHeader {
        HttpHeader(fieldName: "If-Modified-Since", value: value)
    }

    static func authorization(_ value: String) -> HttpHeader {
        HttpHeader(fieldName: "Authorization", value: value)
    }

    static func authorizationBearer(_ value: String) -> HttpHeader {
        .authorization("Bearer \(value)")
    }
}
