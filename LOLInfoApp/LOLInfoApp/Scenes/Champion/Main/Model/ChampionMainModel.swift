//
//  ChampionMainModel.swift
//  LOLInfoApp
//
//  Created by Jeong Deokho on 2024/02/15.
//

import Foundation

struct ChampionMainModel: Decodable {
    let data: [String: Champion]
}

extension ChampionMainModel {
    struct Champion: Decodable, Hashable {
        let name, title, id: String
        let tags: [Tag]
    }
    
    enum Tag: String, Codable {
        case assassin = "Assassin"
        case fighter = "Fighter"
        case mage = "Mage"
        case marksman = "Marksman"
        case support = "Support"
        case tank = "Tank"
        
        var koreanText: String {
            switch self {
            case .assassin:
                return "암살자"
            case .fighter:
                return "전사"
            case .mage:
                return "마법사"
            case .marksman:
                return "원거리 딜러"
            case .support:
                return "서포터"
            case .tank:
                return "탱커"
            }
        }
    }
}
