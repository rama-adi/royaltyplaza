//
//  AuthAPI.swift
//  royaltyplaza
//
//  Created by Rama Adi Nugraha on 28/05/23.
//

import Foundation
import Alamofire
import SwiftyJSON
import Combine

struct UserAPI {
    
    static func login(email: String, password: String, employeeMode: Bool) -> AnyPublisher<APIResponse<JSON>, APIManager.APIError> {
        
        var params = ["email": email, "password": password]
        
        if employeeMode {
            params["store_worker"] = "1"
        }
        
        return APIManager.makeRequest(
            url: "api/auth/login",
            method: .post, parameters: params
        )
    }
    
    static func userData(token: String) -> AnyPublisher<APIResponse<User>, APIManager.APIError> {
        let headers: HTTPHeaders = ["Authorization": "Bearer \(token)"]
        
        return APIManager.makeRequest(
            url: "api/my/data",
            headers: headers
        )
    }
    
}
