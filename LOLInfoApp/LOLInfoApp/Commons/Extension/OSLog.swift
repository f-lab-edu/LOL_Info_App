//
//  OSLogEx.swift
//  LOLInfoApp
//
//  Created by Jeong Deokho on 2024/02/15.
//

import Foundation
import OSLog

extension OSLog {
    
    private static let subsystem = Bundle.main.bundleIdentifier ?? ""
    
    // MARK: - Network
    
    static let network = OSLog(subsystem: subsystem, category: "Network")
    static let networkError = OSLog(
        subsystem: subsystem,
        category: "NetwrokError"
    )
    
}
