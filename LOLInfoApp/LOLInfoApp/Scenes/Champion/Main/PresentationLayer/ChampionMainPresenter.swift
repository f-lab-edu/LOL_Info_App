//
//  ChampionMainPresenter.swift
//  LOLInfoApp
//
//  Created by 정덕호 on 3/31/24.
//

import Combine
import Foundation

// MARK: - Presenter

final class ChampionMainPresenter {
    private let useCase: ChampionMainUseCaseDependency
    private var cancellables: Set<AnyCancellable> = []


    init(useCase: ChampionMainUseCaseDependency = ChampionMainUseCase()) {
        self.useCase = useCase
    }
}

// MARK: - Input

extension ChampionMainPresenter {
    struct Input {
        let fetchAllChampionList = PassthroughSubject<Void, Never>()
    }
}

// MARK: - Output

extension ChampionMainPresenter {
    struct Output {
        let mainListViewModels = PassthroughSubject<[ChampionMainListViewModel], Never>()
        let showRetryAlert = PassthroughSubject<String, Never>()
        let onOffIndicator = PassthroughSubject<Bool, Never>()
    }
}

// MARK: - Transform

extension ChampionMainPresenter {
    func transform(input: Input) -> Output {
        let output = Output()

        input.fetchAllChampionList
            .sink { [weak self] _ in
                self?.fetchAllChampionList(output: output)
            }
            .store(in: &cancellables)

        return output
    }
}

// MARK: - Helper Function

extension ChampionMainPresenter {
    private func fetchAllChampionList(output: Output) {
        output.onOffIndicator.send(true)
        useCase.getChampionMainListViewModels()
            .catch { error in
                output.showRetryAlert.send(error.localizedDescription)
                Log.error(error.localizedDescription, error)
                return Just<[ChampionMainListViewModel]>([])
            }
            .sink { viewModel in
                output.onOffIndicator.send(false)
                output.mainListViewModels.send(viewModel)
            }
            .store(in: &cancellables)
    }
}

