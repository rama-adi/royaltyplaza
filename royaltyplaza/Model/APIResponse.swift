//
//  APIResponse.swift
//  royaltyplaza
//
//  Created by Rama Adi Nugraha on 28/05/23.
//

import Foundation

struct APIResponse<T: Codable>: Codable {
    var success: Bool
    var data: T
    var message: String
}
