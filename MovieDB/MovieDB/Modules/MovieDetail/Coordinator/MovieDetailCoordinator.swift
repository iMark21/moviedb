//
//  MovieDetailCoordinator.swift
//  MovieDB
//
//  Created by Juan Miguel Marqués Morilla on 20/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import UIKit

class MovieDetailCoordinator: CoordinatorProtocol {

    private let navigationController: UINavigationController
    private let movieId: String

    init(navigationController: UINavigationController,
         movieId: String) {
        self.navigationController = navigationController
        self.movieId = movieId
    }

    func start() {
        showMovieDetail()
    }
    
    func finish(animated: Bool) {
        navigationController
            .popViewController(animated: animated)
    }

    private func showMovieDetail(){
        if let viewController = MovieDetailViewController.instantiate(storyboardName: LayoutConstants.Storyboard.Main) {
            
            let apiClient = APIClient.init(baseURL: URL.init(string: APIConstants.api.baseUrl)!)
            let repository = MovieDetailRepository.init(apiClient: apiClient, movieId: movieId)
            
            let viewModel = MovieDetailViewModel.init(repository: repository)
            viewController.viewModel = viewModel
            
            navigationController.pushViewController(viewController, animated: true)
        }
    }
    
}
