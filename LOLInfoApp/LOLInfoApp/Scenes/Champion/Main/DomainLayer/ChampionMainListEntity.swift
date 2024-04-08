//
//  ChampionMainListEntity.swift
//  LOLInfoApp
//
//  Created by 정덕호 on 2024/02/22.
//

import Foundation

// MARK: - typealias

typealias ChampionMainEntity = ChampionMainListEntity.ChampionMainEntity

// MARK: - ChampionMainListEntity

struct ChampionMainListEntity {
    let championList: [ChampionMainEntity]
}

// MARK: - ChampionMainEntity

extension ChampionMainListEntity {
    struct ChampionMainEntity {
        let name: String
        let title: String
        let id: String
        let roleGroup: [RoleGroup]
    }
}

// MARK: - RoleGroup

extension ChampionMainEntity {
    enum RoleGroup: String {
        case assassin = "암살자"
        case fighter = "전사"
        case mage = "마법사"
        case marksman = "원거리 딜러"
        case support = "서포터"
        case tank = "탱커"
    }
}
