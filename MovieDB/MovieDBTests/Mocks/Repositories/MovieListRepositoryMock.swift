//
//  MovieListRepositoryMock.swift
//  MovieDBTests
//
//  Created by Juan Miguel Marqués Morilla on 20/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import Foundation
import RxSwift

@testable import MovieDB

class MovieListRepositoryMock: MovieListRepositoryProtocol {
    
    var apiClient: APIClientProtocol
    var local: MovieListLocalProtocol
    var empty: Bool
    
    init(apiClient: APIClientProtocol,
         local: MovieListLocalProtocol,
         empty: Bool) {
        self.apiClient = apiClient
        self.local = local
        self.empty = empty
    }
    
    func fetchMovieList() -> Observable<MovieListResponse> {
        let result =  Result.init(popularity: 23.3, voteCount: 2, video: false, posterPath: "", id: 1, adult: false, backdropPath: "", originalLanguage: "es", originalTitle: "Godfather", genreIds: [2], title: "El Padrino", voteAverage: 10, overview: "La mejor película de la historia ...", releaseDate: "")
        
        if empty{
            let response = MovieListResponse.init(page: 0, totalResults: 0, totalPages: 1, movies: [])
            return .just(response)
        }else{
            let response = MovieListResponse.init(page: 0, totalResults: 1, totalPages: 1, movies: [result])
            return .just(response)
        }
    }
    
}
