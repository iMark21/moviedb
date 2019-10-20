//
//  MovieListResponse.swift
//  MovieDB
//
//  Created by Juan Miguel Marqués Morilla on 19/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import Foundation

struct MovieListResponse: Codable {
    let page: Int?
    let totalResults: Int?
    let totalPages: Int?
    let movies: [Result]?
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case movies = "results"
    }
    
    init(page: Int?, totalResults: Int?, totalPages: Int?, movies: [Result]?) {
        self.page = page
        self.totalResults = totalResults
        self.totalPages = totalPages
        self.movies = movies
    }
}

struct Result: Codable {
    let popularity: Double?
    let voteCount: Int?
    let video: Bool?
    let posterPath: String?
    let id: Int?
    let adult: Bool?
    let backdropPath: String?
    let originalLanguage: String?
    let originalTitle: String?
    let genreIds: [Int]?
    let title: String?
    let voteAverage: Double?
    let overview: String?
    let releaseDate: String?
    
    enum CodingKeys: String, CodingKey {
        case popularity = "popularity"
        case voteCount = "vote_count"
        case video = "video"
        case posterPath = "poster_path"
        case id = "id"
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIds = "genre_ids"
        case title = "title"
        case voteAverage = "vote_average"
        case overview = "overview"
        case releaseDate = "release_date"
    }
    
    init(popularity: Double?, voteCount: Int?, video: Bool?, posterPath: String?, id: Int?, adult: Bool?, backdropPath: String?, originalLanguage: String?, originalTitle: String?, genreIds: [Int]?, title: String?, voteAverage: Double?, overview: String?, releaseDate: String?) {
        self.popularity = popularity
        self.voteCount = voteCount
        self.video = video
        self.posterPath = posterPath
        self.id = id
        self.adult = adult
        self.backdropPath = backdropPath
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.genreIds = genreIds
        self.title = title
        self.voteAverage = voteAverage
        self.overview = overview
        self.releaseDate = releaseDate
    }
}
