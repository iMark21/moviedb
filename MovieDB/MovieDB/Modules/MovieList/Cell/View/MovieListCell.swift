//
//  MovieListCell.swift
//  MovieDB
//
//  Created by Juan Miguel Marqués Morilla on 19/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import UIKit
import Kingfisher

class MovieListCell: UITableViewCell {

    @IBOutlet weak var imagView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imagView.image = nil
        titleLabel.text = nil
        descriptionLabel.text = nil
    }

    
    func setup(viewModel: MovieListViewModelCellProtocol){
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.overview
        
        guard let url = URL.init(string: viewModel.imageUrl) else {
            return
        }
        
        imagView.kf.indicatorType = .activity
        imagView.kf.setImage(with: url)

    }
    
}
