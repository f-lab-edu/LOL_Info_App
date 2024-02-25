//
//  Bundle.swift
//  LOLInfoApp
//
//  Created by 정덕호 on 2024/02/22.
//

import Foundation

// MARK: - Helper Function

extension Bundle {
    private static func getPlistData(resource: String) ->  [String: Any ] {
        guard let path = Self.main.path(forResource: resource, ofType: "plist") else { return [:] }
        guard let data = FileManager.default.contents(atPath: path) else { return [:] }
        guard let plistData = try? PropertyListSerialization.propertyList(
            from: data,
            format: nil
        ) as? [String: Any] else { return  [:] }
        return plistData
    }
}

//MARK: - URL.plist

extension Bundle {
    enum URLKey: String {
        case baseURL
    }
    
    static func getURLString(key: URLKey) -> String {
        return getPlistData(resource: "URL")[key.rawValue] as? String ?? ""
    }
}

//MARK: - ChampionPath.plist

extension Bundle {
    enum ChampionPathKey: String {
        case main
    }
    
    static func getChampionPathString(key: ChampionPathKey) -> String {
        return getPlistData(resource: "ChampionPath")[key.rawValue] as? String ?? ""
    }
}
