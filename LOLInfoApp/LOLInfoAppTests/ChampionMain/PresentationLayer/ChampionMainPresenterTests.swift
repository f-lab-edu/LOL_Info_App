//
//  ChampionMainPresenterTests.swift
//  LOLInfoAppTests
//
//  Created by 정덕호 on 3/31/24.
//

import Combine
import XCTest
@testable import LOLInfoApp

final class ChampionMainPresenterTests: XCTestCase {
    var presenter: ChampionMainPresenter!
    var mockUseCase: MockChampionMainUseCase!
    var cancellables: Set<AnyCancellable>!
    var input: ChampionMainPresenter.Input!
    var output: ChampionMainPresenter.Output!

    override func setUp() {
        super.setUp()
        mockUseCase = MockChampionMainUseCase()
        let mockViewModels = MockChampionMainListEntity.entity.championList.map {
            ChampionMainListViewModel(entity: $0)
        }
        mockUseCase.mockViewModels = mockViewModels
        presenter = ChampionMainPresenter(useCase: mockUseCase)
        input = ChampionMainPresenter.Input()
        output = presenter.transform(input: input)
        cancellables = []
    }

    override func tearDown() {
        super.tearDown()
        mockUseCase = nil
        presenter = nil
        cancellables = nil
        input = nil
        output = nil
    }

    func test_fetchAllChampionList가_정상응답일때_Indicator가_Off되는지() {
        // given
        let onOffIndicatorExpectation = expectation(description: "onOffIndicator")
        var onOffIndicator: [Bool] = []

        // when
        output.onOffIndicator.sink {
            onOffIndicator.append($0)
            guard onOffIndicator.count == 2 else { return }
            onOffIndicatorExpectation.fulfill()
        }
        .store(in: &cancellables)

        input.fetchAllChampionList.send(())

        // then
        wait(for: [onOffIndicatorExpectation], timeout: 1)
        XCTAssertEqual(onOffIndicator, [true, false])
    }

    func test_fetchAllChampionList가_정상응답일때_mainListViewModels가_정상적으로_전달되는지() {
        // given
        let mainListViewModelsExpectation = expectation(description: "expectationMainListViewModels")
        var mainListViewModels: [ChampionMainListViewModel]?

        // when
        output.mainListViewModels.sink {
            mainListViewModels = $0
            mainListViewModelsExpectation.fulfill()
        }
        .store(in: &cancellables)

        input.fetchAllChampionList.send(())

        // then
        wait(for: [mainListViewModelsExpectation], timeout: 1)
        XCTAssertNotNil(mainListViewModels)
    }

    func test_fetchAllChampionList가_에러응답일때_ShowRetryAlert에_에러메시지가_전달되는지() {
        // given
        mockUseCase.shouldReturnError = true
        let expectation = expectation(description: "ShowRetryAlert")
        var errorMessage: String = ""

        // when
        output.showRetryAlert.sink {
            errorMessage = $0
            expectation.fulfill()
        }
        .store(in: &cancellables)

        input.fetchAllChampionList.send(())

        // then
        wait(for: [expectation], timeout: 1)
        XCTAssertEqual(errorMessage, MockError.mockError.localizedDescription)
    }
}
