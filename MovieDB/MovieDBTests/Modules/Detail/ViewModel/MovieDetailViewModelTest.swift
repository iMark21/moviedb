//
//  MovieDetailViewModelTest.swift
//  MovieDBTests
//
//  Created by Juan Miguel Marqués Morilla on 20/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import XCTest
import RxTest
import RxSwift

@testable import MovieDB

class MovieDetailViewModelTest: XCTestCase {
    
    private var scheduler: TestScheduler!
    private var viewState: TestableObserver<MovieDetailViewState>!
    private var disposeBag: DisposeBag!
    
    override func setUp() {
        super.setUp()
        scheduler = TestScheduler(initialClock: 0)
        viewState = scheduler.createObserver(MovieDetailViewState.self)
        disposeBag = DisposeBag()
    }

    override func tearDown() {
        scheduler = nil
        viewState = nil
        disposeBag = nil
        super.tearDown()
    }

    func testLoading(){
        //Given
        let apiClient = APIClientMock.init(baseUrl: URL.init(string: APIConstants.api.baseUrl)!)
        let repository = MovieDetailRepositoryMock.init(apiClient: apiClient,
                                                        movieId: "12")
        let viewModel =  MovieDetailViewModel.init(repository: repository)
        
        viewModel.state
            .bind(to: viewState)
            .disposed(by: disposeBag)
        
        //When
        viewModel.requestData(scheduler: scheduler)
        scheduler.start()
        
        //Then
        let state = (viewState.events[0].value).element!

        XCTAssertEqual(state, MovieDetailViewState.loading)
    }
    
    func testLoaded(){
        //Given
        let apiClient = APIClientMock.init(baseUrl: URL.init(string: APIConstants.api.baseUrl)!)
        let repository = MovieDetailRepositoryMock.init(apiClient: apiClient,
                                                        movieId: "12")
        let viewModel =  MovieDetailViewModel.init(repository: repository)

        viewModel.state
            .bind(to: viewState)
            .disposed(by: disposeBag)

        //When
        viewModel.requestData(scheduler: scheduler)
        scheduler.start()

        //Then
        let state = (viewState.events[1].value).element!

        switch state {
        case .loaded(viewResponse: let viewResponse):
            XCTAssertEqual(viewState.events, [
                .next(0, MovieDetailViewState.loading),
                .next(1, MovieDetailViewState.loaded(viewResponse: viewResponse))])
        default:
            XCTFail()
        }
    }
}
