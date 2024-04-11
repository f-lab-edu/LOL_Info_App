//
//  LOLInfoAppTests.swift
//  LOLInfoAppTests
//
//  Created by 정덕호 on 2024/03/10.
//

import XCTest

import Combine
import XCTest

@testable import LOLInfoApp

final class ChampionMainUseCaseTests: XCTestCase {

    var networkRequestTimeout: Double!
    var useCase: ChampionMainUseCase!
    var mockRepository: MockChampionMainRepository!
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        networkRequestTimeout = 3
        mockRepository = MockChampionMainRepository(mockEntity: MockChampionMainListEntity.entity)
        useCase = ChampionMainUseCase(repository: mockRepository)
        cancellables = []
    }

    override func tearDown() {
        super.tearDown()
        networkRequestTimeout = nil
        mockRepository = nil
        useCase = nil
        cancellables = nil
    }

    func test_getChampionMainListViewModels가ViewModels를_제대로_반환하는지() {
        //given
        let expectation = expectation(description: "getChampionMainListViewModels ViewModels")
        var result: [ChampionMainListViewModel]?

        //when
        useCase.getChampionMainListViewModels()
            .sink { _ in
            } receiveValue: { viewModels in
                result = viewModels
                expectation.fulfill()
            }
            .store(in: &cancellables)

        //then
        wait(for: [expectation], timeout: networkRequestTimeout)
        XCTAssertNotNil(result)
        XCTAssertFalse(result?.isEmpty ?? true)

        let url = Bundle.getURLString(key: .squareImageURL)
        let fileExtend = FileNameConstants.png
        XCTAssertEqual(result?[0].nameAndTtitleLabelText, "가렌 • 데마시아의 힘")
        XCTAssertEqual(result?[1].roleLabelText, "암살자, 마법사")
        XCTAssertEqual(result?[2].imageURLString, "\(url)\("Hecarim")\(fileExtend)")
        cancellables = []
    }

    func test_sortByChampionName이_이름을_가나다_순으로_잘_정렬하는지() {
        //given
        let expectation = expectation(description: "sortByChampionName")
        var result: [ChampionMainListViewModel]?

        //when
        useCase.getChampionMainListViewModels()
            .sink { _ in
            } receiveValue: { viewModels in
                result = viewModels
                expectation.fulfill()
            }
            .store(in: &cancellables)

        //then
        wait(for: [expectation], timeout: networkRequestTimeout)
        XCTAssertEqual(result?[0].nameAndTtitleLabelText ?? "", "가렌 • 데마시아의 힘")
        XCTAssertEqual(result?[1].nameAndTtitleLabelText ?? "", "아리 • 구미호")
        XCTAssertEqual(result?[2].nameAndTtitleLabelText ?? "", "헤카림 • 전쟁의 전조")
        cancellables = []
    }

    func test_getChampionMainListViewModels가_에러를_제대로_반환하는지() {
        //given
        mockRepository.errorToReturn = MockError.mockError
        let expectation = expectation(description: "getChampionMainListViewModels")
        var result: MockError?

        //when
        useCase.getChampionMainListViewModels()
            .sink { completion in
                if case let .failure(error) = completion {
                    result = error as? MockError
                    expectation.fulfill()
                }
            } receiveValue: { _ in
            }
            .store(in: &cancellables)

        //then
        wait(for: [expectation], timeout: networkRequestTimeout)
        XCTAssertNotNil(result)
        XCTAssertEqual(result, MockError.mockError)
        cancellables = []
    }

}
