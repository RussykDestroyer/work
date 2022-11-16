//
//  AuthorizationService.swift
//  restaurant
//
//  Created by Aldiyar Akhmediyev on 16.11.2022.
//

import Foundation


enum AuthenticationError: Error{
    case invalidCredentials
    case custom(errorMessage: String)
}

enum NetworkError: Error{
    case invalidURL
    case noData
    case decodingError
}

struct LoginRequestBody: Codable{
    let username: String
    let password: String
}

struct LoginResponse: Codable {
    let access: String?
    let refresh: String?
//    let message: String?
//    let success: Bool?
}

class Webservice {

    func login(username: String, password: String, completion: @escaping(Result<String, AuthenticationError>) -> Void){

        guard let url = URL(string: "http://localhost:8000/api/login_by_email/") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        
        let body = LoginRequestBody(username: username, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "No data")))
                return
            }
            
           // try! JSONDecoder().decode(LoginResponse.self, from: data)
            
            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from:data) else{
                completion(.failure(.invalidCredentials))
                return
            }
            
            guard let access = loginResponse.access else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            completion(.success(access))
        }.resume()
    }
        
}
