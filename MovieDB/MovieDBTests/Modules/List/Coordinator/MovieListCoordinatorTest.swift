//
//  MovieListCoordinatorTest.swift
//  MovieDBTests
//
//  Created by Juan Miguel Marqués Morilla on 20/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import XCTest

@testable import MovieDB

class MovieListCoordinatorTest: XCTestCase {

    var navigationController: UINavigationControllerMock!
    
    override func setUp() {
        super.setUp()
        navigationController = UINavigationControllerMock()
    }

    override func tearDown() {
        navigationController = nil
    }

    func testStart() {
        let coordinator = MovieListCoordinator.init(navigationController: navigationController)
        coordinator.start()
        let viewControllerToPresent = navigationController.viewControllerToPush as? MovieListViewController
        XCTAssertNotNil(viewControllerToPresent)
    }
    
    func testFinish(){
        let coordinator = MovieListCoordinator.init(navigationController: navigationController)
        //Given
        coordinator.finish(animated: true)
        
        //Then
        XCTAssert(navigationController.popVCCalled)
    }

}
