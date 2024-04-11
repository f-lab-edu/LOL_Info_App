//
//  MockChampionMainRepository.swift
//  LOLInfoAppTests
//
//  Created by 정덕호 on 2024/03/10.
//

import Combine
import Foundation

@testable import LOLInfoApp

// MARK: - Properties

final class MockChampionMainRepository: ChampionMainRepositoryDependency {
    var errorToReturn: MockError?
    var mockEntity: ChampionMainListEntity

    init(mockEntity: ChampionMainListEntity) {
        self.mockEntity = mockEntity
    }
}

// MARK: - Request Function

extension MockChampionMainRepository {
    func requestAllChampionList() -> AnyPublisher<LOLInfoApp.ChampionMainListEntity, Error> {
        guard let errorToReturn else {
            return Just(mockEntity)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
        return Fail(error: errorToReturn)
            .eraseToAnyPublisher()
    }
}
