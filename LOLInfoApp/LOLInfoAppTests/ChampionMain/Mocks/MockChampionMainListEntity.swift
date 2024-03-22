//
//  MockChampionMainListEntity.swift
//  LOLInfoAppTests
//
//  Created by 정덕호 on 2024/03/10.
//

import Foundation

@testable import LOLInfoApp

enum MockChampionMainListEntity {
    static let entity = ChampionMainListEntity(championList: [
        .init(name: "헤카림",
              title: "전쟁의 전조",
              id: "Hecarim",
              roleGroup: [.fighter, .tank]),
        .init(name: "아리",
              title: "구미호",
              id: "Ahri",
              roleGroup: [.assassin, .mage]),
        .init(name: "가렌",
              title: "데마시아의 힘",
              id: "Garen",
              roleGroup: [.fighter, .tank])
    ])
}
