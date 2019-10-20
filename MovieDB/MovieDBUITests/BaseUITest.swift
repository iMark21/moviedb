//
//  BaseUITest.swift
//  MovieDBUITests
//
//  Created by Juan Miguel Marqués Morilla on 20/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import XCTest

@testable import MovieDB

class BaseUITests: XCTestCase {

    let app = MovieDBUIApplication()
    let timeoutDuration: TimeInterval = 10.0
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }
    
    override func tearDown() {
        super.tearDown()
    }

}
