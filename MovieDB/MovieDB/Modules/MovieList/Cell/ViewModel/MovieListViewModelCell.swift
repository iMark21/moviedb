//
//  MovieListViewModelCell.swift
//  MovieDB
//
//  Created by Juan Miguel Marqués Morilla on 19/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import Foundation

protocol MovieListViewModelCellProtocol {
    var id: String {get}
    var title: String {get}
    var overview: String {get}
    var imageUrl: String {get}
    var voteAverage: String {get}
}

class MovieListViewModelCell: MovieListViewModelCellProtocol {
    
    var id: String
    var title: String
    var overview: String
    var imageUrl: String
    var voteAverage: String
    
    init(response: Result) {
        self.id = String(describing: response.id!)
        self.title = response.title ?? ""
        self.overview = response.overview ?? ""
        self.imageUrl = APIConstants.api.urlImages + (response.posterPath ?? "")
        self.voteAverage = String(format:"%f", response.voteAverage ?? 0)
    }
}
