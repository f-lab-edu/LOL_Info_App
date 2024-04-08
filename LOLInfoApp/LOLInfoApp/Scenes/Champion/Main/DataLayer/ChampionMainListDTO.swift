//
//  ChampionMainListDTO.swift
//  LOLInfoApp
//
//  Created by Jeong Deokho on 2024/02/15.
//

import Foundation

// MARK: - typealias

typealias ChampionMainDTO = ChampionMainListDTO.ChampionMainDTO

// MARK: - ChampionMainListDTO

struct ChampionMainListDTO: Decodable {
    let data: [String: ChampionMainDTO]

    func toEntity() -> ChampionMainListEntity {
        let list = self.data
            .map { $0.value.toEntity() }
        return ChampionMainListEntity(championList: list)
    }
}

// MARK: - ChampionMainDTO

extension ChampionMainListDTO {
    struct ChampionMainDTO: Decodable, Hashable {
        let name: String
        let title: String
        let id: String
        let tags: [Tag]

        func toEntity() -> ChampionMainEntity {
            return ChampionMainListEntity.ChampionMainEntity(
                name: self.name,
                title: self.title,
                id: self.id,
                roleGroup: self.tags.map { $0.toEntity() }
            )
        }
    }
}

// MARK: - Tag

extension ChampionMainDTO {
    enum Tag: String, Codable {
        case assassin = "Assassin"
        case fighter = "Fighter"
        case mage = "Mage"
        case marksman = "Marksman"
        case support = "Support"
        case tank = "Tank"

        func toEntity() -> ChampionMainEntity.RoleGroup {
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
}
