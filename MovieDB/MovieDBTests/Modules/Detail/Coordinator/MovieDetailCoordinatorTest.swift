//
//  MovieDetailCoordinatorTest.swift
//  MovieDBTests
//
//  Created by Juan Miguel Marqués Morilla on 20/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import XCTest

@testable import MovieDB

class MovieDetailCoordinatorTest: XCTestCase {

    var navigationController: UINavigationControllerMock!
    
    override func setUp() {
        super.setUp()
        navigationController = UINavigationControllerMock()
    }

    override func tearDown() {
        navigationController = nil
    }

    func testStart() {
        let coordinator = MovieDetailCoordinator.init(navigationController: navigationController,
                                                      movieId: "12")
        coordinator.start()
        let viewControllerToPresent = navigationController.viewControllerToPush as? MovieDetailViewController
        XCTAssertNotNil(viewControllerToPresent)
    }
    
    func testFinish(){
        let coordinator = MovieDetailCoordinator.init(navigationController: navigationController,
                                                      movieId: "12")
        //Given
        coordinator.finish(animated: true)
        
        //Then
        XCTAssert(navigationController.popVCCalled)
    }

}
