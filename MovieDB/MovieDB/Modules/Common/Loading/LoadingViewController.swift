//
//  LoadingViewController.swift
//  MovieDB
//
//  Created by Juan Miguel Marqués Morilla on 20/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    private lazy var activityIndicator = UIActivityIndicatorView.init(style: .large)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor =  UIColor.systemBackground
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator
                .centerXAnchor
                .constraint(equalTo: view.centerXAnchor),
            activityIndicator
                .centerYAnchor
                .constraint(equalTo: view.centerYAnchor)
            ])
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // We use a 0.5 second delay to not show an activity indicator
        // in case our data loads very quickly.
        DispatchQueue
            .main
            .asyncAfter(deadline:
            .now() + 0.5) { [weak self] in
            self?.activityIndicator.startAnimating()
        }
    }
}
