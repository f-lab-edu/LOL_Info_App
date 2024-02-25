//
//  ChampionAPIEndpoint.swift
//  LOLInfoApp
//
//  Created by Jeong Deokho on 2024/02/15.
//

import Foundation

import Alamofire

enum ChampionAPIEndpoint: Requestable {
    
    // MARK: - Case
    
    case main
    
    // MARK: - Path
    
    var path: String {
        switch self {
        case .main:
            return Bundle.getChampionPathString(key: .main)
        }
    }
    
    // MARK: - URL
    
    var url: String {
        switch self {
        case .main:
            return Bundle.getURLString(key: .baseURL) + path
        }
    }
    
    // MARK: - HTTPMethod
    
    var httpMethod: HTTPMethod {
        switch self {
        case .main:
            return .get
        }
    }
}
