//
//  UIColor.swift
//  LOLInfoApp
//
//  Created by Jeong Deokho on 2024/02/27.
//

import UIKit

// MARK: - Color

extension UIColor {
    static let baseColor: UIColor? = UIColor(named: ColorKey.base.rawValue)
}

// MARK: - Color Key

extension UIColor {
    enum ColorKey: String {
        case base
    }
}
