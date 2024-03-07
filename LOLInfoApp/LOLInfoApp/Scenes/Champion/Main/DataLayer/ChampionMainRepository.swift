//
//  ChampionMainRepository.swift
//  LOLInfoApp
//
//  Created by 정덕호 on 2024/02/22.
//

import Foundation

import Combine

protocol ChampionMainRepositoryDependency  {
    func requestAllChampionList() -> AnyPublisher<ChampionMainListEntity, Error>
}

struct ChampionMainRepository: ChampionMainRepositoryDependency {
    func requestAllChampionList() -> AnyPublisher<ChampionMainListEntity, Error> {
        let publisher: AnyPublisher<ChampionMainListDTO, Error> =
        ChampionAPIEndpoint.main.requestData()
        return publisher
            .map { $0.toEntity() }
            .eraseToAnyPublisher()
    }
}
