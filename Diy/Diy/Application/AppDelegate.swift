//
//  AppDelegate.swift
//  Diy
//
//  Created by Mohanraj S K on 18/02/22.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: Variables

    var window: UIWindow?
    var navigationController: UINavigationController?
    var forceEnableBLE: Bool = false
    var bleManager: BLEManager?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        buildUI()
        IQKeyboardManager.shared.enable = true
        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {

        if forceEnableBLE {
            bleManager = BLEManager { [weak self] state in
                if state != .poweredOn {
                    if self?.forceEnableBLE ?? false {
                        self?.navigationController?.popToRootViewController(animated: true)
                    }
                }
            }
        }

    }

    // MARK: Instance Methods

    private func buildUI() {

        window = UIWindow(frame: UIScreen.main.bounds)
        navigationController = UINavigationController.init(rootViewController: WelcomeVC.loadFromNib())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

    }

}
