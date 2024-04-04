//
//  Coordinatorable.swift
//  LOLInfoApp
//
//  Created by 정덕호 on 3/31/24.
//

import Foundation
import UIKit

protocol Coordinatorable {
    var navigationController: UINavigationController? { get set }

    func start()
}
