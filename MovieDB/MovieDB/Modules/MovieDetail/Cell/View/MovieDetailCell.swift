//
//  MovieListDetailCell.swift
//  MovieDB
//
//  Created by Juan Miguel Marqués Morilla on 20/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import UIKit

class MovieDetailCell: UITableViewCell {

    @IBOutlet weak var titleLabeld: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(viewModel: MovieDetailViewModelCellProtocol){
        self.titleLabeld.text = viewModel.title
        self.valueLabel.text = viewModel.value
    }
    
}
