//
//  AppDelegate.swift
//  MovieDB
//
//  Created by Juan Miguel Marques Morilla on 18/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let currentWindow = self.window {
            let appCoordinator: AppCoordinator = AppCoordinator (window: currentWindow, navigationController: UINavigationController())
            appCoordinator.start()
            currentWindow.makeKeyAndVisible()
        }

        return true
    }

}
