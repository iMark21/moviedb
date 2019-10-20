//
//  MovieDetailViewModelCell.swift
//  MovieDB
//
//  Created by Juan Miguel Marqués Morilla on 20/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import Foundation

protocol MovieDetailViewModelCellProtocol {
    var title: String {get}
    var value: String {get}
}

class MovieDetailViewModelCell: MovieDetailViewModelCellProtocol {

    var title: String
    var value: String
    
    init(response: Dictionary<String, Any>){
        self.title = (response.keys.first ?? "").uppercased()
        if let value = response.values.first as? String {
            self.value = value
        }else if let value = response.values.first as? Int{
            self.value = String(describing: value)
        }else if let value = response.values.first as? Double{
            self.value = String(describing: value)
        }else if let value = response.values.first as? Array<Any>{
            var strings: [String] = []
            for element in value {
                if let element = element as? [String: Any]{
                    for dictionary in element{
                        let key = dictionary.key.uppercased()
                        let val = "\(String(describing: dictionary.value))"
                        strings.append(key+": "+val)
                    }
                }
            }
            self.value = strings.joined(separator:"\n")
        }else{
            self.value = "\(String(describing: response.values.first))"
        }
    }
    


}
