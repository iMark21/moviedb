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
    
    init() {
    }
    
    func persistMovieListData(response: MovieListResponse) -> Observable<MovieListResponse> {
        return .just(response)
    }
    
    func retrieveMovieListResponse() -> MovieListResponse? {
        return nil
    }
    
}
