//
//  Loyalty.swift
//  royaltyplaza
//
//  Created by Rama Adi Nugraha on 28/05/23.
//

import Foundation
public struct Loyalty: Codable, Identifiable {
    public let id: Int
    public let store: String
    public let photo: String
    public let points: Int
    public let foregroundColor: String
    public let backgroundColor: String
    public let createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case store = "store"
        case photo = "photo"
        case points = "points"
        case foregroundColor = "foreground_color"
        case backgroundColor = "background_color"
        case createdAt = "created_at"
    }
    
    public init(id: Int, store: String, photo: String, points: Int, foregroundColor: String, backgroundColor: String, createdAt: String) {
        self.id = id
        self.store = store
        self.photo = photo
        self.points = points
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.createdAt = createdAt
    }
}
