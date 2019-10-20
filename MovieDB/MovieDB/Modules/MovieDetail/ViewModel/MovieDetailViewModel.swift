//
//  MovieDetailViewModel.swift
//  MovieDB
//
//  Created by Juan Miguel Marqués Morilla on 20/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import Foundation
import RxSwift

enum MovieDetailAction : Equatable {
    case finish
    
    static func == (lhs: MovieDetailAction, rhs: MovieDetailAction) -> Bool {
        switch (lhs, rhs) {
        case (.finish, .finish):
            return true
        }
    }
}

enum MovieDetailViewState : Equatable {
    
    case loading
    case loaded(viewResponse: Observable<[MovieDetailViewModelCellProtocol]>)
    case empty
    case error
    
    static func == (lhs: MovieDetailViewState, rhs: MovieDetailViewState) -> Bool {
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

protocol MovieDetailViewModelProtocol {
    var state: PublishSubject<MovieDetailViewState> { get }
    var action: PublishSubject<MovieDetailAction> { get }
    
    func requestData(scheduler: SchedulerType)
    func navigateNextModule(action: MovieListAction)
}

class MovieDetailViewModel: MovieDetailViewModelProtocol {
    
    var state: PublishSubject<MovieDetailViewState>
    var action: PublishSubject<MovieDetailAction>
    
    private let repository: MovieDetailRepositoryProtocol
    private let disposeBag: DisposeBag

    init(repository: MovieDetailRepositoryProtocol) {
        self.repository = repository
        self.state = PublishSubject<MovieDetailViewState>()
        self.action = PublishSubject<MovieDetailAction>()
        self.disposeBag = DisposeBag()
    }
    
    func requestData(scheduler: SchedulerType) {
        state.onNext(.loading)
        repository
            .fetchDetail()
            .observeOn(scheduler)
            .flatMap({ (response) -> Observable<[MovieDetailViewModelCellProtocol]> in
                return self.buildViewResponse(response: response)
            }).subscribe(onNext: { (response) in
                self.state.onNext(.loaded(viewResponse:.just(response)))
            }, onError: { (error) in
                self.state.onNext(.error)
            }).disposed(by: disposeBag)
    }
    
    func navigateNextModule(action: MovieListAction) {
        
    }
    
    private func buildViewResponse(response: MovieDetailResponse) -> Observable<[MovieDetailViewModelCellProtocol]>{
        var viewResult: [MovieDetailViewModelCellProtocol] = []

        if let optionalDict = response.dictionary {
            for dictionary in optionalDict {
                let dictionary = [dictionary.key : dictionary.value]
                viewResult.append(MovieDetailViewModelCell.init(response: dictionary))
            }
        }
        return .just(viewResult.sorted(by: { $0.title < $1.title }))
    }
}

class DictionaryEncoder {
    private let jsonEncoder = JSONEncoder()

    /// Encodes given Encodable value into an array or dictionary
    func encode<T>(_ value: T) throws -> Any where T: Encodable {
        let jsonData = try jsonEncoder.encode(value)
        return try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments)
    }
}
