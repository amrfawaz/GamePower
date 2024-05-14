//
//  NetworkManager.swift
//  
//
//  Created by AmrFawaz on 14/05/2024.
//

import Alamofire
import Foundation
import Combine

public protocol NetworkRequest {
    var method: HTTPMethod { get }
    var url: String { get }
    var headers: [String: String] { get }
    var params: [String: String]? { get }
}

// Code snippet demonstrating the use of actors
public actor NetworkManager {

    public init() {}

    public func request<T: Decodable>(request: NetworkRequest, of type: T.Type) async throws -> T {
        // Set Encoding
        var encoding: ParameterEncoding = JSONEncoding.default
        switch request.method {
        case .post:
            encoding = JSONEncoding.default
        case .get:
            encoding = URLEncoding.default
        default:
            encoding = JSONEncoding.default
        }

        // You must resume the continuation exactly once
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(
                request.url,
                method: request.method,
                parameters: request.params,
                encoding: encoding,
                headers: HTTPHeaders(request.headers)
            ).responseDecodable(of: type) { response in
                switch response.result {
                case let .success(data):
                    continuation.resume(returning: data)

                case let .failure(error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
