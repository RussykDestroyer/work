//
//  CartWebService.swift
//  restaurant
//
//  Created by Aldiyar Akhmediyev on 17.11.2022.
//

import Foundation


class CartWebService{
    
    @Published var cartItems = [CartItem]()
    
    func getAllCartItems(token: String, completion:@escaping(Result<[CartItem], NetworkError>) -> Void){
        guard let url = URL(string: "http://localhost:8000/api/cart/cart/") else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            
            guard let cartItems = try? JSONDecoder().decode([CartItem].self, from: data) else{
                completion(.failure(.decodingError))
                return
            }
            
            print(cartItems)
            completion(.success(cartItems))
            
        }.resume()
    }
    
    func IncrementCartItem(token: String, id: Int, completion:@escaping(Result<CartItem, NetworkError>) -> Void){
        guard let url = URL(string: "http://localhost:8000/api/cart/increment_cart_item_count/"+String(id)+"/") else {
            completion(.failure(.invalidURL))
            return
        }
            
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            
            guard let cartItem = try? JSONDecoder().decode(CartItem.self, from: data) else{
                completion(.failure(.decodingError))
                return
            }
            
            print(cartItem)
            completion(.success(cartItem))
            
        }.resume()
    }
    
    func DecrementCartItem(token: String, id: Int, completion:@escaping(Result<CartItem, NetworkError>) -> Void){
        guard let url = URL(string: "http://localhost:8000/api/cart/decrement_cart_item_count/"+String(id)+"/") else {
            completion(.failure(.invalidURL))
            return
        }
            
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            
            guard let cartItem = try? JSONDecoder().decode(CartItem.self, from: data) else{
                completion(.failure(.decodingError))
                return
            }
            
            print(cartItem)
            completion(.success(cartItem))
            
        }.resume()
    }
}

