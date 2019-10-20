//
//  MovieListRepository.swift
//  MovieDB
//
//  Created by Juan Miguel Marqués Morilla on 19/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import Foundation
import RxSwift

protocol MovieListRepositoryProtocol {
    var apiClient : APIClientProtocol { get }
    var local: MovieListLocalProtocol { get }
    
    func fetchMovieList() -> Observable <MovieListResponse>
}

class MovieListRepository: MovieListRepositoryProtocol {
    
    var apiClient: APIClientProtocol
    var local: MovieListLocalProtocol
    
    init(apiClient: APIClientProtocol, local: MovieListLocalProtocol) {
        self.apiClient = apiClient
        self.local = local
    }
    
    func fetchMovieList() -> Observable<MovieListResponse> {
        if Reachability.isConnectedToNetwork(){
            return requestMovieList()
        }else{
            return retrieveLocalMovieList()
        }
    }
    
    private func retrieveLocalMovieList() -> Observable<MovieListResponse> {
        if let response = local.retrieveMovieListResponse(){
            return .just(response)
        }else{
            return .just(MovieListResponse.init(page: 0,
                                                totalResults: 0,
                                                totalPages: 0,
                                                movies: []))
        }
    }
    
    private func requestMovieList() -> Observable<MovieListResponse> {
        let request = MovieListRequest.init(apiKey: APIConstants.api.apiKey)
        return apiClient
            .send(apiRequest: request)
            .flatMap{ self.local.persistMovieListData(response: $0) }
    }
}
