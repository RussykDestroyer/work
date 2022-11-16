//
//  LoginViewModel.swift
//  restaurant
//
//  Created by Aldiyar Akhmediyev on 16.11.2022.
//

import Foundation
import SwiftUI




class LoginViewModel: ObservableObject{
    
  //  @Published var loginAlert = false
    @Published var isAuthenticated: Bool = false
    
    var username: String = ""
    var password: String = ""
    
    func login(){
        
        let defaults = UserDefaults.standard
        
        Webservice().login(username: username, password: password){ result in
            switch result {
            case .success(let token):
                print(token)
                defaults.setValue(token, forKey: "jsonwebtoken")
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                }
            case .failure(let error):
                //self.loginAlert = true
                print(error.localizedDescription)
            }
        }
        
    }
    
    func signout(){
        
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "jsonwebtoken")
        DispatchQueue.main.async {
            self.isAuthenticated = false
        }
    }
    
}
