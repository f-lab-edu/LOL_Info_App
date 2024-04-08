//
//  ChampionMainUseCase.swift
//  LOLInfoApp
//
//  Created by 정덕호 on 2024/03/10.
//

import Combine
import Foundation

import Alamofire

// MARK: - Dependency

protocol ChampionMainUseCaseDependency {
    func getChampionMainListViewModels() -> AnyPublisher<[ChampionMainListViewModel], Error>
}

// MARK: - UseCase

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
            .map { sortChampionListByName(model: $0) }
            .map { $0.map { ChampionMainListViewModel(entity: $0) } }
            .eraseToAnyPublisher()
    }
}

// MARK: - Business Logic Function

extension ChampionMainUseCase {
    /// 챔피언 리스트를 '가나다' 순으로 정렬하는 함수입니다.
    private func sortChampionListByName(model: ChampionMainListEntity) -> [ChampionMainEntity] {
        model.championList
            .sorted { $0.name < $1.name }
    }
}
