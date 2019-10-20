//
//  MovieListLocal.swift
//  MovieDB
//
//  Created by Juan Miguel Marqués Morilla on 19/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import Foundation
import RxSwift

protocol MovieListLocalProtocol {
    func persistMovieListData(response: MovieListResponse) -> Observable<MovieListResponse>
    func retrieveMovieListResponse() -> MovieListResponse?
}

class MovieListLocal: MovieListLocalProtocol {
    
    private let database: UserDefaults
    
    init(database: UserDefaults) {
        self.database = database
    }
    
    func persistMovieListData(response: MovieListResponse) -> Observable<MovieListResponse> {
        database.save(response, forKey: "Movies")
        return .just(response)
    }
    
    func retrieveMovieListResponse() -> MovieListResponse? {
        let response: MovieListResponse? = database.getObject(forKey: "Movies")
        return response
    }
}
