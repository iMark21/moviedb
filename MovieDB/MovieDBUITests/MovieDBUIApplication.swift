//
//  MovieDBUIApplication.swift
//  MovieDBUITests
//
//  Created by Juan Miguel Marqués Morilla on 20/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import XCTest

@testable import MovieDB

class MovieDBUIApplication: XCUIApplication {
    override init() {
        super.init()
        launchArguments.append(AccessibilityIdentifiers
            .uitesting
            .uitestingEnvironment)
    }
}
