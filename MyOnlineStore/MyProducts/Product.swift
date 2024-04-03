//
//  Product.swift
//  MyOnlineStore
//
//  Created by Ronak Malick on 29/03/24.
//

import Foundation

struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let price: Float
    let description: String
    let category: String
    let image: String
    let rating: Rating

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case price = "price"
        case description = "description"
        case category = "category"
        case image = "image"
        case rating = "rating"
    }
}

struct Rating: Codable {
    let rate: Float
    let count: Int
    
    private enum CodingKeys: String, CodingKey {
        case rate = "rate"
        case count = "count"
    }
}
