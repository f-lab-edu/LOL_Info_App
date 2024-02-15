//
//  Requestable.swift
//  LOLInfoApp
//
//  Created by Jeong Deokho on 2024/02/15.
//

import Alamofire
import Combine
import Foundation
import OSLog

protocol Requestable {
    var path: String { get }
    var url: String { get }
    var httpMethod: HTTPMethod { get }
    
    func requestData<T: Decodable>() -> AnyPublisher<T, Error>
}

extension Requestable {
    func requestData<T: Decodable>() -> AnyPublisher<T, Error> {
        loggingRequest()
        return AF.request(url, method: httpMethod)
            .validate()
            .response { dataResponse in
                loggingResponse(dataResponse)
            }
            .publishDecodable(type: T.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    private func loggingRequest() {
        os_log(
               """
               Start Rquest
               URL: %@
               HTTPMethod: %@
               """,
               log: .network,
               url,
               httpMethod.rawValue
        )
    }
    
    private func loggingResponse(
        _ dataResponse: AFDataResponse<Data?>
    ) {
        let statusCode = dataResponse.response?.statusCode
        let statusCodeString = statusCode == nil ? "nil" : "\(statusCode ?? 0)"
        os_log(
               """
               Complete Response
               StatusCode: %@
               """,
               log: .network,
               statusCodeString
        )
        guard let error = dataResponse.error else { return }
        os_log("Error: %@", log: .networkError, error as CVarArg)
    }
}
