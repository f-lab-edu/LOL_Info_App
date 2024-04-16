//
//  MockManager.swift
//  AppleSignInTest
//
//  Created by Jeong Deokho on 2024/04/09.
//

import AuthenticationServices
import Combine

@testable import LOLInfoApp

final class MockAppleSignInManager: NSObject, AppleSignInManagerDependency {
    let didFailSignIn = PassthroughSubject<LOLInfoApp.AppleSignInError, Never>()
    let didSuccessSignIn = PassthroughSubject<AppleSignInEntity, Never>()

    var credential: AppleIDCredentialDependency?
    var appleSignInError: Error?

    init(credential: AppleIDCredentialDependency) {
        self.credential = credential
    }

    func startSignIn() {
        guard let appleSignInError else {
            handleSucceedSignIn(credential: credential)
            return
        }
        handleFailedSignIn(error: appleSignInError)
    }
}
