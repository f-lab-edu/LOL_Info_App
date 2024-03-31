//
//  AppCoordinator.swift
//  LOLInfoApp
//
//  Created by 정덕호 on 3/31/24.
//

import UIKit

// MARK: - Coordinator

final class AppCoordinator: Coordinatorable {

    var childCoordinators: [Coordinatorable] = []
    var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
}

// MARK: - Function

extension AppCoordinator {
    func start() {
        showChampionMainViewController()
    }

    private func showChampionMainViewController() {
        let coordinator = ChampionCoordinator(
            navigationController: navigationController
        )
        coordinator.start()
        self.childCoordinators.append(coordinator)
    }
}
