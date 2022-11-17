//
//  CartModel.swift
//  restaurant
//
//  Created by Aldiyar Akhmediyev on 17.11.2022.
//

import Foundation


struct CartItem: Codable {
    var id: Int
    var user: Int
    var dish: Dish
    var sum_price: Float
    var price_per_one: Float
    var count: Int
    //let itemImage: ItemImage?
    
    enum CodingKeys: String, CodingKey {
        case id, user, dish, sum_price, price_per_one, count
    }
    
    init() {
        id = 0
        user = 0
        dish = Dish()
        sum_price = 0
        price_per_one = 0
        count = 0
        //itemImage = ItemImage()
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        user = try container.decode(Int.self, forKey: .user)
        dish = try container.decode(Dish.self, forKey: .dish)
        sum_price = try container.decode(Float.self, forKey: .sum_price)
        price_per_one = try container.decode(Float.self, forKey: .price_per_one)
        count = try container.decode(Int.self, forKey: .count)
    }
}
