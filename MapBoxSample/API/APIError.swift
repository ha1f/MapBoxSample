//
//  APIError.swift
//  MapBoxSample
//
//  Created by ha1f on 2020/08/30.
//  Copyright © 2020 ha1f. All rights reserved.
//

import Foundation

enum APIError: Error {
    case generalError(String)
    case invalidStatusCode(Int)
    case underlying(Error)
    case encodingFailed(EncodingError)
    case decodingFailed(DecodingError)

    init(_ error: Error) {
        switch error {
        case let apiError as APIError:
            self = apiError
        case let encodingError as EncodingError:
            self = .encodingFailed(encodingError)
        case let decodingError as DecodingError:
            self = .decodingFailed(decodingError)
        default:
            self = .underlying(error)
        }
    }

    init(message: String) {
        self = .generalError(message)
    }
}
