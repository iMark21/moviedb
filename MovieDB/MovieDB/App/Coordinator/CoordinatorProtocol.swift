//
//  CoordinatorProtocol.swift
//  MovieDB
//
//  Created by Juan Miguel Marqués Morilla on 19/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import Foundation

protocol CoordinatorProtocol: class {
    func start()
    func finish(animated: Bool)
}
