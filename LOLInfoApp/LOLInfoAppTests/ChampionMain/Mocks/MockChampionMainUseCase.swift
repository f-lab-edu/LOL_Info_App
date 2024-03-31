//
//  MockChampionMainUseCase.swift
//  LOLInfoAppTests
//
//  Created by 정덕호 on 3/31/24.
//

import Combine
import Foundation
@testable import LOLInfoApp

final class MockChampionMainUseCase: ChampionMainUseCaseDependency {
    var shouldReturnError = false
    var mockViewModels: [ChampionMainListViewModel]!

    func getChampionMainListViewModels() -> AnyPublisher<[LOLInfoApp.ChampionMainListViewModel], Error> {
        guard shouldReturnError == false else {
            return Fail(error: MockError.mockError)
                .eraseToAnyPublisher()
        }
        return Just(mockViewModels)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
