//
//  Bundle.swift
//  LOLInfoApp
//
//  Created by 정덕호 on 2024/02/22.
//

import Foundation

extension Bundle {
    
    // MARK: - URL.plist
    
    enum URLKey: String {
        case baseURL
    }
    
    static func getURLString(key: URLKey) -> String {
        guard let path = Self.main.path(forResource: "URL", ofType: "plist") else { return "" }
        guard let data = FileManager.default.contents(atPath: path) else { return "" }
        guard let plistData = try? PropertyListSerialization.propertyList(
            from: data,
            format: nil
        ) as? [String: Any] else { return  "" }
        
        return plistData[key.rawValue] as? String ?? ""
    }
    
}
