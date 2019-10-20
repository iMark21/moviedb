//
//  MovieListUITest.swift
//  MovieDBUITests
//
//  Created by Juan Miguel Marqués Morilla on 20/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import XCTest

class MovieListUITest: BaseUITests {

   override func setUp() {
        super.setUp()
        app.launch()
    }
    
    func testMovieList() {
        // Make sure we're displaying movie list
        let movieList = app.otherElements[AccessibilityIdentifiers.views.list]
        wait(element: movieList, duration: timeoutDuration) { _ in
            let tableView = self.app.tables.matching(identifier: AccessibilityIdentifiers.elements.listTableView)
            
            XCTAssert(tableView.cells.count > 0)
                        
            let cell = self.app.cells.element(boundBy: 1)
            cell.tap()
            
            let detailList = self.app.otherElements[AccessibilityIdentifiers.views.detail]
            self.wait(element: detailList, duration: self.timeoutDuration) { _ in
                let tableView = self.app.tables.matching(identifier: AccessibilityIdentifiers.elements.listTableView)
                XCTAssert(tableView.cells.count > 0)
            }
        }
    }
}
