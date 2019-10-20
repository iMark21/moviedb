//
//  APIConstants.swift
//  MovieDB
//
//  Created by Juan Miguel Marqués Morilla on 19/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import Foundation

struct APIConstants {
    
    struct api {
        static let baseUrl = "https://api.themoviedb.org"
        static let apiKey = "4cefc00a82a57a17b1aebe3e17a359ac"
        static let urlImages = "https://image.tmdb.org/t/p/w92"
    }
    
    struct version {
        static let v3 = "/3/"
    }
    
    struct endpoint {
        static let popular = "movie/popular"
        static let detail = "movie/"
    }
    
    struct paramKeys {
        static let apiKey = "api_key"
    }
    
    enum HTTPHeaderField: String {
        case acceptType = "Accept"
    }

    enum ContentType: String {
        case json = "application/json"
    }
}
