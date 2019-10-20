//
//  MovieDetailRequest.swift
//  MovieDB
//
//  Created by Juan Miguel Marqués Morilla on 20/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import Foundation

class MovieDetailRequest: APIRequest {
    var method = RequestType.GET
    var endPoint: String
    var version = APIConstants.version.v3
    var parameters = [String: String]()
    
    init(apiKey: String, movieId: String) {
        endPoint = "\(APIConstants.endpoint.detail)\(movieId)"
        parameters[APIConstants.paramKeys.apiKey] = apiKey
    }
}
