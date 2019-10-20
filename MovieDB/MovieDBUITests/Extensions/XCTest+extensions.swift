//
//  XCTest+extensions.swift
//  MovieDBUITests
//
//  Created by Juan Miguel Marqués Morilla on 20/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import XCTest

extension XCTestCase {
    func wait(element: XCUIElement, duration: TimeInterval, handler: @escaping (Error?) -> Void) {
        let exists = NSPredicate(format: "exists == true")
        
        expectation(for: exists, evaluatedWith: element) { () -> Bool in
            print("found it! 💪")
            handler(nil)
            return true
        }
        
        waitForExpectations(timeout: duration) { (error) in
            if let notFoundError = error {
                handler(notFoundError)
            }
        }
    }
}
