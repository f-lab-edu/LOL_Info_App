//
//  AppleSignInError.swift
//  LOLInfoApp
//
//  Created by Jeong Deokho on 2024/04/08.
//

import AuthenticationServices

enum AppleSignInError: Error {

    private enum ErrorDescription {
        static let invalidAccount = "잘못된 애플 계정입니다."
        static let failedLogin = "로그인에 실패했습니다. 계속해서 문제 발생시 고객센터로 문의 부탁드립니다."
        static let canceledLogin = "로그인을 취소하였습니다."
    }

    /// AppleIDCredential이  유효하지않은경우 에러
    case invalidAppleIDCredential

    /// 로그인에 필요한 code와 토큰이 유효하지않은경우 에러
    case invalidAuthorizationData

    /// 에러 타입이 ASAuthorizationError가 아닌경우 에러
    case errorTypeMismatch(error: Error?)

    /// 로그인 승인 응답이 잘못 됐을경우 에러
    case invalidResponse

    /// 로그인 승인 요청이 처리되지 않았을때 에러
    case notHandled

    /// 로그인 시도가 실패했을때 에러
    case failed

    /// 자동인증 시나리오에서 실패했을때 에러 (ex: 생체인증)
    case notInteractive

    /// 사용자가 로그인을 취소했을때 에러
    case canceled

    /// 알수없는 에러
    case unknown
}

// MARK: - ASAuthorizationError to AppleSignInError Mapping Function

extension AppleSignInError {
    static func mapToAppleSignInError(errorCode: ASAuthorizationError.Code) -> Self {
        switch errorCode {
        case .invalidResponse:
            return .invalidResponse
        case .notHandled:
            return .notHandled
        case .failed:
            return .failed
        case .notInteractive:
            return .notInteractive
        case .canceled:
            return .canceled
        case .unknown:
            return .unknown
        @unknown default:
            return .unknown
        }
    }
}

// MARK: - Error Description

extension AppleSignInError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidAppleIDCredential, .invalidAuthorizationData:
            return ErrorDescription.invalidAccount
        case .errorTypeMismatch(let error):
            return error?.localizedDescription
        case .invalidResponse, .notHandled, .failed, .notInteractive, .unknown:
            return ErrorDescription.failedLogin
        case .canceled:
            return ErrorDescription.canceledLogin
        }
    }
}

// MARK: - Equatable

extension AppleSignInError: Equatable {
    // 해당코드는 .errorTypeMismatch의 비교 테스트 코드를 위해 필요한 코드입니다
    static func == (lhs: AppleSignInError, rhs: AppleSignInError) -> Bool {
        switch (lhs, rhs) {
        case (.invalidAppleIDCredential, .invalidAppleIDCredential),
             (.invalidAuthorizationData, .invalidAuthorizationData),
             (.invalidResponse, .invalidResponse),
             (.notHandled, .notHandled),
             (.failed, .failed),
             (.notInteractive, .notInteractive),
             (.canceled, .canceled),
             (.unknown, .unknown):
            return true
        case (.errorTypeMismatch(let lhsError), .errorTypeMismatch(let rhsError)):
            return lhsError?.localizedDescription == rhsError?.localizedDescription
        default:
            return false
        }
    }
}
