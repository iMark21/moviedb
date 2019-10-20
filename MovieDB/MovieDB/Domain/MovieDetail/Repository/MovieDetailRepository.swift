//
//  MovieDetailRepository.swift
//  MovieDB
//
//  Created by Juan Miguel Marqués Morilla on 20/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import Foundation
import RxSwift

protocol MovieDetailRepositoryProtocol {
    var apiClient : APIClientProtocol { get }
    var movieId: String {get}
    
    func fetchDetail() -> Observable <MovieDetailResponse>
}

class MovieDetailRepository: MovieDetailRepositoryProtocol {
    
    var apiClient: APIClientProtocol
    var movieId: String
    
    init(apiClient: APIClientProtocol,
         movieId: String) {
        self.apiClient = apiClient
        self.movieId = movieId
    }
    
    func fetchDetail() -> Observable <MovieDetailResponse> {
        return requestMovieDetail()
    }
    
    private func requestMovieDetail() -> Observable <MovieDetailResponse> {
        let request = MovieDetailRequest.init(apiKey: APIConstants.api.apiKey,
                                              movieId: movieId)
        return apiClient.send(apiRequest: request)
    }
    
}

