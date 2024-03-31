//
//  SceneDelegate.swift
//  LOLInfoApp
//
//  Created by 정덕호 on 2024/02/05.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let navigationController = getNavigationController()
        let coordinator = AppCoordinator(
            navigationController: navigationController
        )
        coordinator.start()

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

    private func getNavigationController() -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.navigationBar.tintColor = .label
        return navigationController
    }

}
