//
//  MovieListViewModelTest.swift
//  MovieDBTests
//
//  Created by Juan Miguel Marqués Morilla on 20/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import XCTest
import RxTest
import RxSwift

@testable import MovieDB

class MovieListViewModelTest: XCTestCase {
    
    private var scheduler: TestScheduler!
    private var viewState: TestableObserver<MovieListViewState>!
    private var disposeBag: DisposeBag!
    
    override func setUp() {
        super.setUp()
        scheduler = TestScheduler(initialClock: 0)
        viewState = scheduler.createObserver(MovieListViewState.self)
        disposeBag = DisposeBag()
    }

    override func tearDown() {
        scheduler = nil
        viewState = nil
        super.tearDown()
    }

    func testLoading(){
        //Given
        let apiClient = APIClientMock.init(baseUrl: URL.init(string: APIConstants.api.baseUrl)!)
        let localClient = MovieListLocalMock.init()
        let repository = MovieListRepositoryMock.init(apiClient: apiClient,
                                                      local: localClient,
                                                      empty: false)
        let viewModel =  MovieListViewModel.init(repository: repository)
        
        viewModel.state
            .bind(to: viewState)
            .disposed(by: disposeBag)
        
        //When
        viewModel.requestData(scheduler: scheduler)
        scheduler.start()
        
        //Then
        let state = (viewState.events[0].value).element!

        XCTAssertEqual(state, MovieListViewState.loading)
    }
    
    func testLoaded(){
        //Given
        let apiClient = APIClientMock.init(baseUrl: URL.init(string: APIConstants.api.baseUrl)!)
        let localClient = MovieListLocalMock.init()
        let repository = MovieListRepositoryMock.init(apiClient: apiClient,
                                                      local: localClient,
                                                      empty: false)
        let viewModel =  MovieListViewModel.init(repository: repository)
        
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
                .next(0, MovieListViewState.loading),
                .next(1, MovieListViewState.loaded(viewResponse: viewResponse))])
        default:
            XCTFail()
        }
    }
    
    func testEmpty(){
        //Given
        let apiClient = APIClientMock.init(baseUrl: URL.init(string: APIConstants.api.baseUrl)!)
        let localClient = MovieListLocalMock.init()
        let repository = MovieListRepositoryMock.init(apiClient: apiClient,
                                                      local: localClient,
                                                      empty: true)
        let viewModel =  MovieListViewModel.init(repository: repository)
        
        viewModel.state
            .bind(to: viewState)
            .disposed(by: disposeBag)
        
        //When
        viewModel.requestData(scheduler: scheduler)
        scheduler.start()
        
        //Then
        let state = (viewState.events[1].value).element!
        
        switch state {
        case .empty:
            XCTAssertEqual(viewState.events, [
                .next(0, MovieListViewState.loading),
                .next(1, MovieListViewState.empty)])
        default:
            XCTFail()
        }
    }
}
