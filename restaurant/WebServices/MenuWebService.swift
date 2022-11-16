//
//  MenuWebService.swift
//  restaurant
//
//  Created by Aldiyar Akhmediyev on 16.11.2022.
//

import Foundation


class MenuWebService{
    
    @Published var dished = [Dish]()
    
    func getAllDishes(completion:@escaping(Result<[Dish], NetworkError>) -> Void){
        guard let url = URL(string: "http://localhost:8000/api/menu/dish/") else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            
            guard let dishes = try? JSONDecoder().decode([Dish].self, from: data) else{
                completion(.failure(.decodingError))
                return
            }
            
            print(dishes)
            completion(.success(dishes))
            
        }.resume()
    }
}
