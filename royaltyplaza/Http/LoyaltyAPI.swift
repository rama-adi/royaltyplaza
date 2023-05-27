//
//  LoyaltyAPI.swift
//  royaltyplaza
//
//  Created by Rama Adi Nugraha on 28/05/23.
//

import Foundation
import Alamofire
import SwiftyJSON
import Combine

struct LoyaltyAPI {
    static func getLoyalties(token: String) -> AnyPublisher<APIResponse<[Loyalty]>, APIManager.APIError> {
        let headers: HTTPHeaders = ["Authorization": "Bearer \(token)"]
        
        return APIManager.makeRequest(
            url: "api/my/loyalties",
            headers: headers
        )
    }
    
    static func getCoupons(loyaltyId: Int, token: String)
    -> AnyPublisher<APIResponse<[Coupon]>, APIManager.APIError> {
        
        let headers: HTTPHeaders = ["Authorization": "Bearer \(token)"]
        
        
        return APIManager.makeRequest(
            url: "api/my/loyalties/\(loyaltyId)/coupons",
            headers: headers
        )
    }
}
