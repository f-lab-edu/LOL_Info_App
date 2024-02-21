//
//  ChampionMainListDTO.swift
//  LOLInfoApp
//
//  Created by Jeong Deokho on 2024/02/15.
//

import Foundation

struct ChampionMainListDTO: Decodable {
    let data: [String: ChampionMainListDTO.ChampionMainDTO]
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

extension ChampionMainListDTO {
    func toEntity() -> ChampionMainListEntity {
        let list = self.data
            .map { $0.value.toEntity() }
        return ChampionMainListEntity(championList: list)
    }
}

extension ChampionMainListDTO.ChampionMainDTO {
    func toEntity() -> ChampionMainListEntity.ChampionMainEntity {
        return ChampionMainListEntity.ChampionMainEntity(
            name: self.name,
            title: self.title,
            id: self.id,
            roleGroup: self.tags.map { $0.toEntity() }
        )
    }
}

extension ChampionMainListDTO.Tag {
    func toEntity() -> ChampionMainListEntity.RoleGrop {
        switch self {
        case .assassin:
            return .assassin
        case .fighter:
            return .fighter
        case .mage:
            return .mage
        case .marksman:
            return .marksman
        case .support:
            return .support
        case .tank:
            return .tank
        }
    }
}
