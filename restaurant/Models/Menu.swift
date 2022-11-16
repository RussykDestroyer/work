//
//  Menu.swift
//  restaurant
//
//  Created by Aldiyar Akhmediyev on 16.11.2022.
//

import Foundation


struct Menus: Codable {
    let menus: [MenuItem]
    
    enum CodingKeys: String, CodingKey {
        case menus = "data"
    }
}

struct MenuItem: Codable {
    var id, itemName, description, price : String
    let itemImage: ItemImage?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case itemName, description, itemImage, price
    }
    
    init() {
        itemName = ""
        description = ""
        price = ""
        id = ""
        itemImage = ItemImage()
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        description = try container.decode(String.self, forKey: .description)
        itemName = try container.decode(String.self, forKey: .itemName)
        itemImage = try container.decodeIfPresent(ItemImage.self, forKey: .itemImage)
        price = try container.decode(String.self, forKey: .price)
    }
}

struct ItemImage: Codable {
    let url, alt, name: String?
    
    enum CodingKeys: String, CodingKey {
        case url, alt, name
    }
    
    init() {
        url = ""
        alt = ""
        name = ""
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        alt = try container.decodeIfPresent(String.self, forKey: .alt)
        name = try container.decodeIfPresent(String.self, forKey: .name)

    }
}
