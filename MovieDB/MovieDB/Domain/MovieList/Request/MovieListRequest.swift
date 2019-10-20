//
//  MovieListRequest.swift
//  MovieDB
//
//  Created by Juan Miguel Marqués Morilla on 19/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import Foundation

class MovieListRequest: APIRequest {
    var method = RequestType.GET
    var endPoint = APIConstants.endpoint.popular
    var version = APIConstants.version.v3
    var parameters = [String: String]()
    
    init(apiKey: String) {
        parameters[APIConstants.paramKeys.apiKey] = apiKey
    }
}
