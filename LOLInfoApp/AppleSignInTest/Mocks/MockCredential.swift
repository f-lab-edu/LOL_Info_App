//
//  MockCredential.swift
//  AppleSignInTest
//
//  Created by Jeong Deokho on 2024/04/09.
//

import AuthenticationServices
import Foundation

@testable import LOLInfoApp

struct MockCredential: AppleIDCredentialDependency {
    let email: String? = "testEmail@test.com"
    let fullName: PersonNameComponents? = PersonNameComponents(givenName: "te", familyName: "st")
    let user: String = "testIdentifier"
    let authorizationCode: Data?
    let identityToken: Data?

    init(authorizationCode: Data? = Data(), identityToken: Data? = Data()) {
        self.authorizationCode = authorizationCode
        self.identityToken = identityToken
    }
}
