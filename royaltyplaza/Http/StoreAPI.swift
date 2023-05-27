//
//  StoreAPI.swift
//  royaltyplaza
//
//  Created by Rama Adi Nugraha on 28/05/23.
//

import Foundation
import Alamofire
import SwiftyJSON
import Combine

struct StoreAPI {
    static func getWorkingStore(token: String) -> AnyPublisher<APIResponse<[Store]>, APIManager.APIError> {
        let headers: HTTPHeaders = ["Authorization": "Bearer \(token)"]
        
        return APIManager.makeRequest(
            url: "api/my/stores",
            headers: headers
        )
    }
    
    static func redeemCoupon(code: String, token: String) -> AnyPublisher<APIResponse<JSON>, APIManager.APIError> {
        
        let headers: HTTPHeaders = ["Authorization": "Bearer \(token)"]
        
        return APIManager.makeRequest(
            url: "api/my/coupon/redeem",
            method: .post,
            parameters: [
                "code": code
            ],
            headers: headers
        )
    }
}
