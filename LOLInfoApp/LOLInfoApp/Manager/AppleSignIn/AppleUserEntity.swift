//
//  AppleSignInEntity.swift
//  LOLInfoApp
//
//  Created by Jeong Deokho on 2024/04/08.
//

import Foundation

struct AppleSignInEntity {
    let email: String
    let name: String
    let userIdentifier: String
    let authorizationCode: Data
    let identityToken: Data
}
