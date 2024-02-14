//
//  SceneDelegate.swift
//  LOLInfoApp
//
//  Created by 정덕호 on 2024/02/05.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let mainViewController = ChampionViewController()
        window?.rootViewController = mainViewController
        window?.makeKeyAndVisible()
    }

}

