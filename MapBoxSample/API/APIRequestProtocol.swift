//
//  APIRequestProtocol.swift
//  MapBoxSample
//
//  Created by ha1f on 2020/08/30.
//  Copyright © 2020 ha1f. All rights reserved.
//

import Foundation

protocol APIRequestProtocol {
    associatedtype Response: Decodable
    associatedtype Parameters
    var path: String { get }
    var method: HTTPMethod { get }
}

struct APIRequest<Parameters, Response: Decodable>: APIRequestProtocol {
    var path: String
    var method: HTTPMethod
}
