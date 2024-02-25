//
//  OSLogEx.swift
//  LOLInfoApp
//
//  Created by Jeong Deokho on 2024/02/15.
//

import Foundation
import OSLog

// MARK: - OSLog Properties

extension OSLog {
    static let subsystem = Bundle.main.bundleIdentifier ?? ""
}

// MARK: - Log Level

enum Log {
    enum Level: String {
        case network = "🔵 NETWORK"
        case debug = "🟡 DEBUG"
        case error = "🔴 ERROR"
    }
}

// MARK: - Log Private Helper Function

extension Log {
    static private func log(
        _ message: Any,
        _ arguments: [Any],
        level: Level,
        file: String,
        function: String,
        line: Int
    ) {
        #if DEBUG
        let logMessage = getLogMessage(message,
                                       arguments,
                                       level: level,
                                       file: file,
                                       function: function,
                                       line: line)
        handleLoggingForLevel(logMessage: logMessage, level: level)
        #endif
    }
    
    static private func getLogMessage(
        _ message: Any,
        _ arguments: [Any],
        level: Level,
        file: String,
        function: String,
        line: Int
    ) -> String {
        let fileName = file.split(separator: Constants.separator).last ?? ""
        let argumentsMessage = arguments
            .map { String(describing: $0) }
            .joined(separator: Constants.lineBreak)
        let mainMessage = "\(Constants.lineBreak)Message: \(message)\(Constants.lineBreak)"
        let extraMessage = "Arguments: \(Constants.lineBreak)\(argumentsMessage)"
        var logMessage = mainMessage + extraMessage
        if level != .network {
            let fileMessage = "\(Constants.lineBreak)File: \(fileName)"
            let functionMessage = "\(Constants.lineBreak)Function: \(function)"
            let lineMessage = "\(Constants.lineBreak)Line: \(line)"
            logMessage.insert(
                contentsOf: fileMessage + functionMessage + lineMessage,
                at: logMessage.startIndex
            )
        }
        return logMessage
    }
    
    static private func handleLoggingForLevel(logMessage: String, level: Level) {
        let logger = Logger(subsystem: OSLog.subsystem, category: level.rawValue)
        switch level {
        case .network:
            logger.log("\(logMessage, privacy: .public)")
        case .debug:
            logger.debug("\(logMessage, privacy: .public)")
        case .error:
            logger.error("\(logMessage, privacy: .public)")
        }
    }
}

// MARK: - Log Static Debug Function

extension Log {
    static func debug(
        _ message: Any,
        _ arguments: Any...,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        log(message, arguments, level: .debug, file: file, function: function, line: line)
    }
    
    static func network(
        _ message: Any,
        _ arguments: Any...,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        log(message, arguments, level: .network, file: file, function: function, line: line)
    }
    
    static func error(
        _ message: Any,
        _ arguments: Any...,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        log(message, arguments, level: .error, file: file, function: function, line: line)
    }
}
