//
//  AppleSignInDependency.swift
//  LOLInfoApp
//
//  Created by Jeong Deokho on 2024/04/09.
//

import AuthenticationServices
import Combine

// MARK: - Dependency

protocol AppleSignInManagerDependency {
    var didSuccessSignIn: PassthroughSubject<AppleSignInEntity, Never> { get }
    var didFailSignIn: PassthroughSubject<AppleSignInError, Never> { get }

    func startSignIn()
}

// MARK: - DidComplete Function

extension AppleSignInManagerDependency {
    /// 애플로그인에 성공했을때의 처리를 담당하는 함수입니다.
    func handleSucceedSignIn(credential: AppleIDCredentialDependency?) {
        guard let credential else {
            didFailSignIn.send(.invalidAppleIDCredential)
            return
        }
        guard let authorizationCode = credential.authorizationCode,
              let identityToken = credential.identityToken else {
            didFailSignIn.send(.invalidAuthorizationData)
            return
        }
        let entity = getAppleSignInEntity(credential: credential,
                                          authorizationCode: authorizationCode,
                                          identityToken: identityToken)
        didSuccessSignIn.send(entity)
    }

    /// 애플로그인에 실패했을때의 처리를 담당하는 함수입니다.
    func handleFailedSignIn(error: Error?) {
        guard let error = error as? ASAuthorizationError else {
            return didFailSignIn.send(.errorTypeMismatch(error: error))
        }
        didFailSignIn.send(AppleSignInError.mapToAppleSignInError(errorCode: error.code))
    }

    /// 애플로그인에 필요한 Entity를 생성하는 함수입니다.
    private func getAppleSignInEntity(
        credential: AppleIDCredentialDependency,
        authorizationCode: Data,
        identityToken: Data
    ) -> AppleSignInEntity {
        let firstName = credential.fullName?.givenName ?? ""
        let lastName = credential.fullName?.familyName ?? ""
        return AppleSignInEntity(
            email: credential.email ?? "",
            name: "\(firstName) \(lastName)",
            userIdentifier: credential.user,
            authorizationCode: authorizationCode,
            identityToken: identityToken
        )
    }
}

// MARK: - ASAuthorizationAppleIDCredential Dependency

// ASAuthorizationAppleIDCredential를 상속받아 Mock객체를 구현하는게 불가능하기때문에 Mock객체구현을 위한 프로토콜 입니다.
protocol AppleIDCredentialDependency {
    var authorizationCode: Data? { get }
    var identityToken: Data? { get }
    var fullName: PersonNameComponents? { get }
    var email: String? { get }
    var user: String { get }
}

extension ASAuthorizationAppleIDCredential: AppleIDCredentialDependency {}
