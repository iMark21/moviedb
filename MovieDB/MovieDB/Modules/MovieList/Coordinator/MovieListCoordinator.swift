//
//  MovieListCoordinator.swift
//  MovieDB
//
//  Created by Juan Miguel Marqués Morilla on 19/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import UIKit
import RxSwift

// MARK: - Coordinator keys

enum MovieListChildCoordinator {
    case movieDetail
}


class MovieListCoordinator: CoordinatorProtocol {

    private let navigationController: UINavigationController
    private var childCoordinators: [MovieListChildCoordinator: CoordinatorProtocol]
    private let disposeBag: DisposeBag
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.childCoordinators = [MovieListChildCoordinator: CoordinatorProtocol]()
        self.disposeBag = DisposeBag()
    }

    func start() {
        showMovieList()
    }
    
    func finish(animated: Bool) {
        
    }

    private func showMovieList(){
        if let viewController = MovieListViewController.instantiate(storyboardName: LayoutConstants.Storyboard.Main) {
            
            let apiClient = APIClient.init(baseURL: URL.init(string: APIConstants.api.baseUrl)!)
            let repository = MovieListRepository.init(apiClient: apiClient, local: MovieListLocal.init())
            
            let viewModel = MovieListViewModel.init(repository: repository)
            
            viewModel.action
                .asObserver()
                .bind { (action) in
                    switch action{
                    case .detail(let movieId):
                        self.startMovieDetailModule(movieId: movieId)
                    }
            }.disposed(by: disposeBag)
            
            viewController.viewModel = viewModel
            navigationController.pushViewController(viewController, animated: true)
        }
    }
    
    private func startMovieDetailModule(movieId: String){
        let coordinator = MovieDetailCoordinator(navigationController: navigationController, movieId: movieId)
        childCoordinators[.movieDetail] = coordinator
        coordinator.start()
    }
}
