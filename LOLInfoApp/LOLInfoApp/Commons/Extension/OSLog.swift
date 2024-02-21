//
//  OSLogEx.swift
//  LOLInfoApp
//
//  Created by Jeong Deokho on 2024/02/15.
//

import Foundation
import OSLog

extension OSLog {
    static let subsystem = Bundle.main.bundleIdentifier ?? ""
    static let network = OSLog(subsystem: subsystem, category: "Network")
    static let debug = OSLog(subsystem: subsystem, category: "Debug")
    static let error = OSLog(subsystem: subsystem, category: "Error")
}


struct Log {
    enum Level: String {
        case network = "🔵 NETWORK"
        case debug = "🟡 DEBUG"
        case error = "🔴 ERROR"
    }
    
    static private func log(
        _ message: Any,
        _ arguments: [Any],
        level: Level,
        file: String,
        function: String,
        line: Int
    ) {
        #if DEBUG
        let fileName = file.split(separator: "/").last ?? ""
        let extraMessage = arguments.map({ String(describing: $0) }).joined(separator: "\n")
        var logMessage = "\nMessage: \(message)\n\(extraMessage)"
        if level != .network {
            let debugMessage = "\nFile: \(fileName)\nFunction: \(function)\nLine: \(line)"
            logMessage.insert(contentsOf: "\(debugMessage)", at: logMessage.startIndex)
        }
        let logger = Logger(subsystem: OSLog.subsystem, category: level.rawValue)
        switch level {
        case .network:
            logger.log("\(logMessage, privacy: .public)")
        case .debug:
            logger.debug("\(logMessage, privacy: .public)")
        case .error:
            logger.error("\(logMessage, privacy: .public)")
        }
        #endif
    }
}

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
