//
//  MovieDetailViewModelCellTest.swift
//  MovieDBTests
//
//  Created by Juan Miguel Marqués Morilla on 20/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import XCTest
import RxSwift
import RxTest

@testable import MovieDB

class MovieDetailViewModelCellTest: XCTestCase {
    
    private var detail: MovieDetailResponse!
    private var scheduler: TestScheduler!
    private var viewState: TestableObserver<MovieDetailViewState>!
    private var viewResponse: TestableObserver<[MovieDetailViewModelCellProtocol]>!
    private var disposeBag: DisposeBag!

    override func setUp() {
        super.setUp()
        scheduler = TestScheduler(initialClock: 0)
        viewState = scheduler.createObserver(MovieDetailViewState.self)
        viewResponse = scheduler.createObserver([MovieDetailViewModelCellProtocol].self)
        detail =  MovieDetailResponse.init(id: 12, adult: false, backdropPath: "", belongsToCollection: nil, budget: 1, genres: [], homepage: "", imdbID: "", originalLanguage: "ES", originalName: "Godfather", overview: "La mejor película de la historia ...", popularity: 10, posterPath: "", productionCompanies: [], productionCountries: [], releaseDate: "", revenue: 2, runtime: 1, spokenLanguages: [], status: "", tagline: "", name: "El Padrino", video: false, voteAverage: 2, voteCount: 23)
        disposeBag = DisposeBag()
    }

    override func tearDown() {
        detail = nil
        scheduler = nil
        viewState = nil
        viewResponse = nil
        disposeBag = nil
        super.tearDown()
    }

    func testInit(){
        let movieDetailViewModelCell = MovieDetailViewModelCell.init(response: [:])
        XCTAssertNotNil(movieDetailViewModelCell)
    }
    
    func testNumberOfRows(){
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
        case .loaded(viewResponse: let response):
            response
                .bind(to: viewResponse)
                .disposed(by: disposeBag)
            
            let elements = viewResponse.events[0].value.element
            XCTAssertEqual(elements?.count, 24)
        default:
            XCTFail()
        }
    }

}

