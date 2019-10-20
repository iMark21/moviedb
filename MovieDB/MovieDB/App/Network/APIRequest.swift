//
//  APIRequest.swift
//  MovieDB
//
//  Created by Juan Miguel Marqués Morilla on 19/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import Foundation

public enum RequestType: String {
    case GET, POST, PUT
}

protocol APIRequest {
    var method: RequestType { get }
    var version: String { get }
    var endPoint: String { get }
    var parameters: [String : String] { get }
}

extension APIRequest {
    func request(with baseURL: URL) -> URLRequest {
        guard var components = URLComponents(url: baseURL.appendingPathComponent(version+endPoint),
                                             resolvingAgainstBaseURL: false) else {
            fatalError("Unable to create URL components")
        }

        components.queryItems = parameters.map {
            URLQueryItem(name: String($0), value: String($1))
        }

        guard let url = components.url else {
            fatalError("Could not get url")
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue(APIConstants.ContentType.json.rawValue,
                         forHTTPHeaderField: APIConstants.HTTPHeaderField.acceptType.rawValue)
        return request
    }
}
