//
//  APIManager.swift
//  royaltyplaza
//
//  Created by Rama Adi Nugraha on 28/05/23.
//

import Foundation
import Combine
import Alamofire

struct APIManager {
    
    static let BASE_URL = "http://206.189.88.192:8000"
    
    enum APIError: Error {
        case invalidResponse
        case serverError(code: Int)
    }
    
    
    static func makeRequest<T: Decodable>(
        url: String,
        method: HTTPMethod = .get,
        parameters: [String: Any]? = nil,
        headers: HTTPHeaders? = nil
    ) -> AnyPublisher<T, APIError> {
        AF.request("\(BASE_URL)/\(url)", method: method, parameters: parameters, headers: headers)
            .publishDecodable(type: T.self)
            .tryMap { element -> T in
                switch element.result {
                case .success(let value):
                    return value
                case .failure:
                    guard let statusCode = element.response?.statusCode else {
                        throw APIError.invalidResponse
                    }
                    
                    debugPrint(element.result)
                    debugPrint(element.response as Any)
                    
                    if let data = element.data, let str = String(data: data, encoding: .utf8) {
                        debugPrint("Server Response: \(str)")
                    }
                    
                    throw APIError.serverError(code: statusCode)
                }
            }
            .mapError { $0 as? APIError ?? .invalidResponse }
            .eraseToAnyPublisher()
    }
    
    
}
