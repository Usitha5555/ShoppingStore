//
//  ProductResponse.swift
//  ShoppingStore
//
//  Created by Usitha Kodithuwakku Arachchi on 2024-03-16.
//

import Foundation

// MARK: - Welcome
struct ProductResponse: Codable {
    let data: [Items]
    let success: Bool
    let message: String
}

// MARK: - Datum
struct Items: Codable {
    let id: Int
    let name, description, price, category: String
    let size, color: String
    let image: String
    let quantity: Int
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, name, description, price, category, size, color, image, quantity
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

