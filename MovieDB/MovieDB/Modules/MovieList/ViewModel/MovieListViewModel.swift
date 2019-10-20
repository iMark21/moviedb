//
//  MovieListViewModel.swift
//  MovieDB
//
//  Created by Juan Miguel Marqués Morilla on 19/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import Foundation
import RxSwift

enum MovieListAction : Equatable {
    case detail(movieId: String)
    
    static func == (lhs: MovieListAction, rhs: MovieListAction) -> Bool {
        switch (lhs, rhs) {
        case (.detail, .detail):
            return true
        }
    }
}

enum MovieListViewState : Equatable {
    
    case loading
    case loaded(viewResponse: Observable<[MovieListViewModelCellProtocol]>)
    case empty
    case error
    
    static func == (lhs: MovieListViewState, rhs: MovieListViewState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (.empty, .empty):
            return true
        case (.loaded, .loaded):
            return true
        case (.error, .error):
            return true
        default:
            return false
        }
    }
}

protocol MovieListViewModelProtocol {
    var state: PublishSubject<MovieListViewState> {get}
    var action: PublishSubject<MovieListAction> { get }
    
    func requestData(scheduler: SchedulerType)
    func navigateNextModule(action: MovieListAction)
}

class MovieListViewModel: MovieListViewModelProtocol{

    var state: PublishSubject<MovieListViewState>
    var action: PublishSubject<MovieListAction>
    
    private let repository: MovieListRepositoryProtocol
    private let disposeBag: DisposeBag
    
    init(repository: MovieListRepositoryProtocol) {
        self.repository = repository
        self.state = PublishSubject<MovieListViewState>()
        self.action = PublishSubject<MovieListAction>()
        self.disposeBag = DisposeBag()
    }
    
    // MARK: - Request data
    
    func requestData(scheduler: SchedulerType) {
        state.onNext(.loading)
        repository
            .fetchMovieList()
            .observeOn(scheduler)
            .flatMap({ (response) -> Observable<[MovieListViewModelCellProtocol]> in
                return self.buildViewResponse(response: response)
            }).subscribe(onNext: { (response) in
                if response.count > 0 {
                    self.state
                        .onNext(.loaded(viewResponse:.just(response)))
                }else{
                    self.state
                        .onNext(.empty)
                }
            }, onError: { (error) in
                self.state.onNext(.error)
            }).disposed(by: disposeBag)
    }
    
    // MARK: - Coordinator comunication
    
    func navigateNextModule(action: MovieListAction) {
        self.action.onNext(action)
    }
    
    // MARK: - Private methods
    
    private func buildViewResponse(response: MovieListResponse) -> Observable<[MovieListViewModelCellProtocol]>{
        var movieListViewModelCells: [MovieListViewModelCellProtocol] = []
        guard let movies = response.movies else {
            return .just([])
        }
        for movie in movies {
            let movieListViewModelCell = MovieListViewModelCell.init(response: movie)
            movieListViewModelCells.append(movieListViewModelCell)
        }
        return .just(movieListViewModelCells)
    }
}
