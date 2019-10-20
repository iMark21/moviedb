//
//  MovieListLocalMock.swift
//  MovieDBTests
//
//  Created by Juan Miguel Marqués Morilla on 20/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import Foundation
import RxSwift

@testable import MovieDB

class MovieListLocalMock: MovieListLocalProtocol {
    
    init() {
        
    }
    
    func persistMovieListData(response: MovieListResponse) -> Observable<MovieListResponse> {
        return .just(response)
    }
    
    func retrieveMovieListResponse() -> MovieListResponse? {
        return nil
    }
    
}
