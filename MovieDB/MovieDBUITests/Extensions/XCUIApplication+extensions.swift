//
//  XCUIApplication+extensions.swift
//  MovieDBUITests
//
//  Created by Juan Miguel Marqués Morilla on 20/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import XCTest

extension XCUIApplication {
    func isDisplaying(identifier: String) -> Bool {
        return otherElements[identifier].exists
    }
}
