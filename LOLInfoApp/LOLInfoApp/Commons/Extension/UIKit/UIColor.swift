//
//  UIColor.swift
//  LOLInfoApp
//
//  Created by 정덕호 on 2024/02/24.
//

import UIKit

extension UIColor {
    
    // MARK: - CustomColor
    
    enum Custom: String {
        case base
        case reverseBase
        
        var color: UIColor? {
            return UIColor(named: self.rawValue)
        }
    }
}
