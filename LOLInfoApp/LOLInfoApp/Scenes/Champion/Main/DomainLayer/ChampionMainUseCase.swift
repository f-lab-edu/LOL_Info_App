//
//  ChampionMainUseCase.swift
//  LOLInfoApp
//
//  Created by 정덕호 on 2024/03/10.
//

import Combine
import Foundation

// MARK: - Dependency

protocol ChampionMainUseCaseDependency {
    func getChampionMainListViewModels() -> AnyPublisher<[ChampionMainListViewModel], Error>
}

//MARK: - UseCase

struct ChampionMainUseCase: ChampionMainUseCaseDependency {

    private let repository: ChampionMainRepositoryDependency

    init(repository: ChampionMainRepositoryDependency = ChampionMainRepository()) {
        self.repository = repository
    }
}

// MARK: - Presenter Use Function

extension ChampionMainUseCase {
    func getChampionMainListViewModels() -> AnyPublisher<[ChampionMainListViewModel], Error> {
        return repository.requestAllChampionList()
            .map { sortByChampionName(model: $0) }
            .map { $0.map { ChampionMainListViewModel(entity: $0) } }
            .eraseToAnyPublisher()
    }
}

// MARK: - Helper Function

extension ChampionMainUseCase {
    private func sortByChampionName(model: ChampionMainListEntity) -> [ChampionMainEntity] {
        model.championList
            .sorted { $0.name < $1.name }
    }
}
