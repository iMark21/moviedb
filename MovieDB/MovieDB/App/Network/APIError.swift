//
//  APIError.swift
//  MovieDB
//
//  Created by Juan Miguel Marqués Morilla on 19/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import Foundation

enum APIError: Error {
    case forbidden              //Status 400
    case unauthorized           //Status code 403
    case notFound               //Status code 404
    case validationError        //Status code 422
    case internalServerError    //Status code 500
}
