//
//  MovieDetailCoordinator.swift
//  MovieDB
//
//  Created by Juan Miguel Marqués Morilla on 20/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import UIKit
import RxSwift

class MovieDetailCoordinator: CoordinatorProtocol {

    //public access
    var action: PublishSubject<MovieDetailAction>
    
    private let navigationController: UINavigationController
    private let movieId: String

    init(navigationController: UINavigationController,
         movieId: String) {
        self.navigationController = navigationController
        self.movieId = movieId
        self.action = PublishSubject<MovieDetailAction>()
    }

    func start() {
        showMovieDetail()
    }
    
    func finish(animated: Bool) {
        navigationController.popViewController(animated: animated)
        action.onNext(.finish)
    }

    private func showMovieDetail(){
        guard let viewController = MovieDetailViewController.instantiate(storyboardName: LayoutConstants.Storyboard.Main) else {return}
        let apiClient = APIClient.init(baseURL: URL.init(string: APIConstants.api.baseUrl)!)
        let repository = MovieDetailRepository.init(apiClient: apiClient, movieId: movieId)
        let viewModel = MovieDetailViewModel.init(repository: repository)
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }
    
}
