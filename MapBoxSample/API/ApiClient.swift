//
//  ApiClient.swift
//  MapBoxSample
//
//  Created by ha1f on 2020/08/30.
//  Copyright © 2020 ha1f. All rights reserved.
//

import Foundation
import Combine

final class ApiClient {
    let baseURL: URL

    private let _decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

    private var _session: URLSession {
        URLSession.shared
    }

    private let httpHeaders: [HttpHeader] = [
        .userAgent("MapBoxSample")
    ]

    init(baseURL: URL) {
        self.baseURL = baseURL
    }

    private func _send<D: Decodable>(path: String, method: HTTPMethod) -> AnyPublisher<D, APIError> {
        let url = baseURL.appendingPathComponent(path)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        for httpHeader in httpHeaders {
            urlRequest.addValue(httpHeader.value, forHTTPHeaderField: httpHeader.fieldName)
        }

        return _session.dataTaskPublisher(for: urlRequest)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw APIError(message: "Failed to cast response of \(type(of: response)) to HTTPURLResponse.")
                }
                guard (200..<300).contains(httpResponse.statusCode) else {
                    throw APIError.invalidStatusCode(httpResponse.statusCode)
                }
                return data
            }
            .decode(type: D.self, decoder: _decoder)
            .mapError(APIError.init)
            .eraseToAnyPublisher()
    }

    func send<R: APIRequestProtocol>(request: R) -> AnyPublisher<R.Response, APIError> {
        _send(path: request.path, method: request.method)
    }
}
