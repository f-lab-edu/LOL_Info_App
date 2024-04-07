//
//  ChampionMainRepository.swift
//  LOLInfoApp
//
//  Created by 정덕호 on 2024/02/22.
//

import Combine
import Foundation

import Alamofire

// MARK: - EndPoint

struct ChampionMainRepository: Requestable {

    var path: String {
        return Bundle.getChampionPathString(key: .main)
    }

    var url: String {
            return Bundle.getURLString(key: .baseURL) + path
    }

    var httpMethod: HTTPMethod {
            return .get
    }
}

// MARK: - Dependency

protocol ChampionMainRepositoryDependency {
    func requestAllChampionList() -> AnyPublisher<ChampionMainListEntity, Error>
}

// MARK: - Request Function

extension ChampionMainRepository: ChampionMainRepositoryDependency {
    func requestAllChampionList() -> AnyPublisher<ChampionMainListEntity, Error> {
        let publisher: AnyPublisher<ChampionMainListDTO, Error> = requestData()
        return publisher
            .map { $0.toEntity() }
            .eraseToAnyPublisher()
    }
}
