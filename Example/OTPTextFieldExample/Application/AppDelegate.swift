//
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties

    var window: UIWindow?

    // MARK: - Private Properties

    private lazy var mainCoordinator: Coordinator = makeCoordinator()

    // MARK: - UIApplicationDelegate

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        initializeRootView()
        mainCoordinator.start()
        return true
    }

}

// MARK: - Private Methods

private extension AppDelegate {

    func initializeRootView() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIViewController()
        window?.makeKeyAndVisible()
    }

    func makeCoordinator() -> Coordinator {
        return MainCoordinator()
    }

}
