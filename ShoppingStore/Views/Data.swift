//
//  Data.swift
//  ShoppingStore
//
//  Created by Usitha Kodithuwakku Arachchi on 2024-03-20.
//
import SwiftUI

struct CartItem {
    let cartId: UUID
    let pid: Int
    let name: String
    let price: Double
    var quantity: Int
    let imageURL: String
    let size: String
    let eachPrice: String
}

var cartItems: [CartItem] = []
