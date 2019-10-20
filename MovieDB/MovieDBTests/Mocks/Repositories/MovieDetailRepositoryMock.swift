//
//  MovieDetailRepositoryMock.swift
//  MovieDBTests
//
//  Created by Juan Miguel Marqués Morilla on 20/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import Foundation
import RxSwift

@testable import MovieDB

class MovieDetailRepositoryMock: MovieDetailRepositoryProtocol {

    var apiClient: APIClientProtocol
    var movieId: String
    
    init(apiClient: APIClientProtocol,
         movieId: String) {
        self.apiClient = apiClient
        self.movieId = movieId
    }
    
    func fetchDetail() -> Observable<MovieDetailResponse> {
        let response = MovieDetailResponse.init(id: 12, adult: false, backdropPath: "", belongsToCollection: nil, budget: 1, genres: [], homepage: "", imdbID: "", originalLanguage: "ES", originalName: "Godfather", overview: "La mejor película de la historia ...", popularity: 10, posterPath: "", productionCompanies: [], productionCountries: [], releaseDate: "", revenue: 2, runtime: 1, spokenLanguages: [], status: "", tagline: "", name: "El Padrino", video: false, voteAverage: 2, voteCount: 23)
        
        return .just(response)
    }
    
}

