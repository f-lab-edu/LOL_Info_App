//
//  ChampionCoordinator.swift
//  LOLInfoApp
//
//  Created by 정덕호 on 3/31/24.
//

import UIKit

// MARK: - Protocol

protocol ChampionCoordinatorActions: Coordinatorable {
    func showChampionDetail(index: Int)
}

// MARK: - Coordinator

struct ChampionCoordinator: ChampionCoordinatorActions {
    var navigationController: UINavigationController?
}

// MARK: - Function

extension ChampionCoordinator {
    func start() {
        let viewController = ChampionMainViewController()
        navigationController?.viewControllers = [viewController]
    }

    func showChampionDetail(index: Int) {
        // DetailViewController는 구현이 안된 상태지만 예시로 작업했습니다.
        let viewController = UIViewController()
        navigationController?.pushViewController(
            viewController,
            animated: true
        )
    }
}
