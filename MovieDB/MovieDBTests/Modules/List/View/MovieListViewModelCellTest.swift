//
//  MovieListViewModelCellTest.swift
//  MovieDBTests
//
//  Created by Juan Miguel Marqués Morilla on 20/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import XCTest

@testable import MovieDB

class MovieListViewModelCellTest: XCTestCase {
    
    private var movie: Result!

    override func setUp() {
        super.setUp()
        movie =  Result.init(popularity: 23.3, voteCount: 2, video: false, posterPath: "", id: 1, adult: false, backdropPath: "", originalLanguage: "es", originalTitle: "Godfather", genreIds: [2], title: "El Padrino", voteAverage: 10, overview: "La mejor película de la historia ...", releaseDate: "")    }

    override func tearDown() {
        movie = nil
        super.tearDown()
    }

    func testInit(){
        let movieListViewModelCell = MovieListViewModelCell.init(response: movie)
        XCTAssertNotNil(movieListViewModelCell)
    }
    
    func testTitleComponent(){
        let movieListViewModelCell = MovieListViewModelCell.init(response: movie)
        XCTAssertEqual(movie.title, movieListViewModelCell.title)
    }
    
    func testOverviewComponent(){
        let movieListViewModelCell = MovieListViewModelCell.init(response: movie)
        XCTAssertEqual(movie.overview, movieListViewModelCell.overview)
    }
    
    func testVoteAverageComponent(){
        let movieListViewModelCell = MovieListViewModelCell.init(response: movie)
        XCTAssertEqual(String(format:"%f", movie.voteAverage ?? 0), movieListViewModelCell.voteAverage)
    }

}
