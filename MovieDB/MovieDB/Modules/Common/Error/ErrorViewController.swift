//
//  ErrorViewController.swift
//  MovieDB
//
//  Created by Juan Miguel Marqués Morilla on 20/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

struct AlertAction {
    let buttonTitle: String
    let handler: (() -> Void)?
}

struct SingleButtonAlert {
    let title: String
    let message: String?
    let action: AlertAction
}

class ErrorViewController: UIViewController {

    var reloadDataAction = BehaviorRelay<Bool>(value: false)

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.showError()
    }

    func showError() {
        let action = AlertAction(buttonTitle: NSLocalizedString("_button_error_message",
                                                                comment: ""), handler: {
            self.reloadDataAction.accept(true)
        })
        let alert = SingleButtonAlert(title: NSLocalizedString("_title_error_message", comment: ""),
                                      message: NSLocalizedString("_description_error_message", comment: ""),
                                      action: action)
        self.setShowError(alert: alert)
    }

    func setShowError(alert: SingleButtonAlert) {
        let alertController = UIAlertController(title: alert.title,
                                                message: alert.message,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: alert.action.buttonTitle,
                                                style: .default,
                                                handler: { _ in alert.action.handler?() }))
        self.present(alertController, animated: true, completion: nil)
    }

}
