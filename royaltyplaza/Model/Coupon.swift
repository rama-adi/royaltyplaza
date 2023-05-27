//
//  Coupon.swift
//  royaltyplaza
//
//  Created by Rama Adi Nugraha on 28/05/23.
//

import Foundation

public struct Coupon: Codable, Identifiable {
    public let id: Int
    public let code: String
    public let title: String
    public let description: String
    public let createdAt: String
    public let redeemedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case code = "code"
        case title = "title"
        case description = "description"
        case createdAt = "created_at"
        case redeemedAt = "redeemed_at"
    }
    
    public init(id: Int, code: String, title: String, description: String, createdAt: String, redeemedAt: String?) {
        self.id = id
        self.code = code
        self.title = title
        self.description = description
        self.createdAt = createdAt
        self.redeemedAt = redeemedAt
    }
}
