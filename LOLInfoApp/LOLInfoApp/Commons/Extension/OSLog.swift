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
        var logMessage = getLogMessage(message,
                                       arguments)
        logMessage.insert(
            contentsOf: getLogMessage(level: level, file: file, function: function, line: line),
            at: logMessage.startIndex
        )
        handleLoggingForLevel(logMessage: logMessage, level: level)
        #endif
    }
    
    static private func getLogMessage(_ message: Any, _ arguments: [Any]) -> String {
        let argumentsMessage = arguments
            .map { String(describing: $0) }
            .joined(separator: StringConstants.lineBreak)
        let mainMessage = "\(StringConstants.lineBreak)Message: \(message)\(StringConstants.lineBreak)"
        let extraMessage = "Arguments: \(StringConstants.lineBreak)\(argumentsMessage)"
        return mainMessage + extraMessage
    }
    
    static private func getLogMessage(
        level: Level,
        file: String,
        function: String,
        line: Int
    ) -> String {
        guard level != .network else { return "" }
        let fileName = file.split(separator: StringConstants.separator).last ?? ""
        let fileMessage = "\(StringConstants.lineBreak)File: \(fileName)"
        let functionMessage = "\(StringConstants.lineBreak)Function: \(function)"
        let lineMessage = "\(StringConstants.lineBreak)Line: \(line)"
        return fileMessage + functionMessage + lineMessage
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
