//
//  AppleSignInManager.swift
//  LOLInfoApp
//
//  Created by Jeong Deokho on 2024/04/08.
//

import AuthenticationServices
import Combine

// MARK: - AppleSignInManager

final class AppleSignInManager: NSObject, AppleSignInManagerDependency {
    let didFailSignIn = PassthroughSubject<AppleSignInError, Never>()
    let didSuccessSignIn = PassthroughSubject<AppleSignInEntity, Never>()

    func startSignIn() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.performRequests()
    }
}

// MARK: - ASAuthorizationControllerDelegate

extension AppleSignInManager: ASAuthorizationControllerDelegate {
    func authorizationController(
        controller: ASAuthorizationController,
        didCompleteWithAuthorization authorization: ASAuthorization
    ) {
        let credential = authorization.credential as? ASAuthorizationAppleIDCredential
        handleSucceedSignIn(credential: credential)
    }

    func authorizationController(
        controller: ASAuthorizationController,
        didCompleteWithError error: Error
    ) {
        handleFailedSignIn(error: error)
    }
}
