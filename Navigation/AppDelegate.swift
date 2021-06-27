//
//  AppDelegate.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private var mainCoordinator: MainCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let mainCoordinator = MainCoordinator(window: window)
        self.window = window
        self.mainCoordinator = mainCoordinator
        mainCoordinator.start()
        
        UIApplication.shared.setMinimumBackgroundFetchInterval(
          UIApplication.backgroundFetchIntervalMinimum)
        
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        //
    }
    
    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {

        if let navController = window?.rootViewController as? UINavigationController {
            let viewController = navController.viewControllers[0] as! MyTabBarController
            
            viewController.fetch {
                viewController.updateUI()
                  completionHandler(.newData)
            }
        }
    }
}

