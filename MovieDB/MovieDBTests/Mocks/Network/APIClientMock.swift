//
//  APIClientMock.swift
//  MovieDBTests
//
//  Created by Juan Miguel Marqués Morilla on 20/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import Foundation
import RxSwift

@testable import MovieDB

class APIClientMock: APIClientProtocol {
    var baseUrl: URL
    
    init(baseUrl: URL) {
        self.baseUrl = baseUrl
    }

    func send<T>(apiRequest: APIRequest) -> Observable<T> where T : Decodable, T : Encodable {
        let result: T = Codable.self as! T
        return Observable.just(result)
    }
    
}
