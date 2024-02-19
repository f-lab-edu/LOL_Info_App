//
//  ChampionMainListDTO.swift
//  LOLInfoApp
//
//  Created by Jeong Deokho on 2024/02/15.
//

import Foundation

struct ChampionMainListDTO: Decodable {
    let data: [String: ChampionMainListDTO]
}

extension ChampionMainListDTO {
    struct ChampionMainDTO: Decodable, Hashable {
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
    }
}
