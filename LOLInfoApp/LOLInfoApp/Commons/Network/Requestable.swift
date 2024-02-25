//
//  Requestable.swift
//  LOLInfoApp
//
//  Created by Jeong Deokho on 2024/02/15.
//

import Foundation
import OSLog

import Alamofire
import Combine

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
        Log.network("Start Request", url, "HTTPMethod: \(httpMethod.rawValue)")
    }
    
    private func loggingResponse(_ dataResponse: AFDataResponse<Data?>) {
        let statusCode: Any = dataResponse.response?.statusCode ?? "nil"
        Log.network("Complete Response", url, "StatusCode: \(statusCode)")
    }}
