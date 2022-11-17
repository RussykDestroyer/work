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
}

