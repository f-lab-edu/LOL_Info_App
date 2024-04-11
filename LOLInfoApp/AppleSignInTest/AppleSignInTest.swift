//
//  AppleSignInTest.swift
//  AppleSignInTest
//
//  Created by Jeong Deokho on 2024/04/09.
//

import AuthenticationServices
import Combine
import XCTest

@testable import LOLInfoApp

final class AppleSignInTest: XCTestCase {

    var credential: MockCredential!
    var appleSignInManager: MockAppleSignInManager!
    var authServiceResponseTime: Double!
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        credential = MockCredential()
        appleSignInManager = MockAppleSignInManager(credential: credential)
        authServiceResponseTime = 3
        cancellables = []
    }

    override func tearDown() {
        credential = nil
        appleSignInManager = nil
        authServiceResponseTime = nil
        cancellables = nil
    }

    func test_로그인에_성공할때_Entity를_반환하는지() {
        // given
        let expectation = expectation(description: "validationEntity")
        var result: AppleSignInEntity?

        // when
        appleSignInManager.didSuccessSignIn
            .sink { _ in
            } receiveValue: { entity in
                result = entity
                expectation.fulfill()
            }
            .store(in: &cancellables)
        appleSignInManager.startSignIn()

        // then
        wait(for: [expectation], timeout: authServiceResponseTime)
        let firstName = credential.fullName?.givenName ?? ""
        let lastName = credential.fullName?.familyName ?? ""
        let successResultName = "\(firstName) \(lastName)"
        XCTAssertEqual(result?.name, successResultName)
        XCTAssertEqual(result?.email, credential.email)
        XCTAssertEqual(result?.userIdentifier, credential.user)
        cancellables = []
    }

    func test_로그인에_성공했지만_credential이_유효하지않을때_invalidAppleIDCredential_에러를_반환하는지() {
        // given
        let expectation = expectation(description: "invalidAppleIDCredential")
        var result: AppleSignInError?
        appleSignInManager.credential = nil

        // when
        appleSignInManager.didFailSignIn
            .sink(receiveValue: { error in
                result = error
                expectation.fulfill()
            })
            .store(in: &cancellables)
        appleSignInManager.startSignIn()

        // then
        wait(for: [expectation], timeout: authServiceResponseTime)
        XCTAssertEqual(result, AppleSignInError.invalidAppleIDCredential)
        cancellables = []
    }

    func test_로그인에_성공했지만_authorizationCode가_유효하지않을때_invalidAuthorizationData_에러를_반환하는지() {
        // given
        let expectation = expectation(description: "invalidAuthorizationData")
        var result: AppleSignInError?
        appleSignInManager.credential = MockCredential(authorizationCode: nil)

        // when
        appleSignInManager.didFailSignIn
            .sink(receiveValue: { error in
                result = error
                expectation.fulfill()
            })
            .store(in: &cancellables)
        appleSignInManager.startSignIn()

        // then
        wait(for: [expectation], timeout: authServiceResponseTime)
        XCTAssertEqual(result, AppleSignInError.invalidAuthorizationData)
        cancellables = []
    }

    func test_로그인에_성공했지만_identityToken가_유효하지않을때_invalidAuthorizationData_에러를_반환하는지() {
        // given
        let expectation = expectation(description: "invalidAuthorizationData")
        var result: AppleSignInError?
        appleSignInManager.credential = MockCredential(identityToken: nil)

        // when
        appleSignInManager.didFailSignIn
            .sink(receiveValue: { error in
                result = error
                expectation.fulfill()
            })
            .store(in: &cancellables)
        appleSignInManager.startSignIn()

        // then
        wait(for: [expectation], timeout: authServiceResponseTime)
        XCTAssertEqual(result, AppleSignInError.invalidAuthorizationData)
        cancellables = []
    }

    func test_로그인에실패했을때_에러가_ASAuthorizationError_타입이아닌경우_errorTypeMismatch_에러를_반환하는지() {
        // given
        let expectation = expectation(description: "errorTypeMismatch")
        var result: AppleSignInError?
        appleSignInManager.appleSignInError = MockError.mock

        // when
        appleSignInManager.didFailSignIn
            .sink(receiveValue: { error in
                result = error
                expectation.fulfill()
            })
            .store(in: &cancellables)
        appleSignInManager.startSignIn()

        // then
        wait(for: [expectation], timeout: authServiceResponseTime)
        XCTAssertEqual(result, AppleSignInError.errorTypeMismatch(error: MockError.mock))
        cancellables = []
    }

    func test_로그인에실패했을때_에러가_ASAuthorizationError_타입인경우_mapToAppleSignInError로_매핑된_에러를_반환하는지() {
        // given
        let expectation = expectation(description: "mapToAppleSignInError")
        let errorList: [ASAuthorizationError] = [
            .init(.invalidResponse),
            .init(.notHandled),
            .init(.failed),
            .init(.notInteractive),
            .init(.canceled),
            .init(.unknown)
        ]
        var result: [AppleSignInError] = []

        // when
        appleSignInManager.didFailSignIn
            .sink(receiveValue: { error in
                result.append(error)
                guard result.count == errorList.count else { return }
                expectation.fulfill()
            })
            .store(in: &cancellables)

        errorList.forEach {
            appleSignInManager.appleSignInError = $0
            appleSignInManager.startSignIn()
        }

        // then
        wait(for: [expectation], timeout: authServiceResponseTime)
        XCTAssertEqual(
            result, [.invalidResponse, .notHandled, .failed, .notInteractive, .canceled, .unknown]
        )
        cancellables = []
    }
}
