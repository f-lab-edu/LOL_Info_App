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
    var shouldReturnError = false
    var mockEntity: ChampionMainListEntity!
}

// MARK: - Request Function

extension MockChampionMainRepository {
    func requestAllChampionList() -> AnyPublisher<LOLInfoApp.ChampionMainListEntity, Error> {
        guard shouldReturnError == false else {
            return Fail(error: MockError.mockError)
                .eraseToAnyPublisher()
        }
        return Just(mockEntity)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
