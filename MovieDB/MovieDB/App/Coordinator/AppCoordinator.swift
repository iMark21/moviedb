//
//  AppCoordinator.swift
//  MovieDB
//
//  Created by Juan Miguel Marqués Morilla on 18/05/2019.
//  Copyright © 2019 Míchel Marqués Morilla. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

// MARK: - Coordinator keys

enum AppChildCoordinator {
    case movieList
}


class AppCoordinator: CoordinatorProtocol {
    
    private let window: UIWindow
    private let navigationController: UINavigationController
    private var childCoordinators :[AppChildCoordinator: CoordinatorProtocol]
    private let disposeBag: DisposeBag

    init(window: UIWindow, navigationController: UINavigationController) {
        self.window = window
        self.navigationController = navigationController
        self.childCoordinators = [AppChildCoordinator: CoordinatorProtocol]()
        self.window.rootViewController = navigationController
        self.disposeBag = DisposeBag()
    }

    func start() {
        startMovieListModule()
    }
    
    func finish(animated: Bool) {
        childCoordinators[.movieList] = nil
    }

    func startMovieListModule() {
        let coordinator = MovieListCoordinator(navigationController: navigationController)
        childCoordinators[.movieList] = coordinator
        coordinator.start()
    }

}
