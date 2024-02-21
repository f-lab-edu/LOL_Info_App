//
//  ChampionMainListEntity.swift
//  LOLInfoApp
//
//  Created by 정덕호 on 2024/02/22.
//

import Foundation

struct ChampionMainListEntity {
    let championList: [ChampionMainEntity]
    
    struct ChampionMainEntity {
        let name, title, id: String
        let roleGroup: [RoleGrop]
    }
}

extension ChampionMainListEntity {
    enum RoleGrop: String {
        case assassin = "암살자"
        case fighter = "전사"
        case mage = "마법사"
        case marksman = "원거리 딜러"
        case support = "서포터"
        case tank = "탱커"
    }
}
