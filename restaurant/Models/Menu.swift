//
//  Menu.swift
//  restaurant
//
//  Created by Aldiyar Akhmediyev on 16.11.2022.
//

import Foundation


struct Dishes: Codable {
    let dishes: [Dish]
    
    enum CodingKeys: String, CodingKey {
        case dishes = "data"
    }
}

struct Dish: Codable {
    var id: Int
    var name: String
    var price, weight: Float
    var photo: String?
    //let itemImage: ItemImage?
    
    enum CodingKeys: String, CodingKey {
        case id, name, price, weight, photo
    }
    
    init() {
        id = 0
        name = ""
        price = 0
        weight = 0
        photo = ""
        //itemImage = ItemImage()
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        photo = try container.decodeIfPresent(String.self, forKey: .photo)
        weight = try container.decode(Float.self, forKey: .weight)
        price = try container.decode(Float.self, forKey: .price)
    }
}

//struct ItemImage: Codable {
//    let url, alt, name: String?
//
//    enum CodingKeys: String, CodingKey {
//        case url, alt, name
//    }
//
//    init() {
//        url = ""
//        alt = ""
//        name = ""
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        url = try container.decodeIfPresent(String.self, forKey: .url)
//        alt = try container.decodeIfPresent(String.self, forKey: .alt)
//        name = try container.decodeIfPresent(String.self, forKey: .name)
//
//    }
//}
