//
//  CartViewModel.swift
//  restaurant
//
//  Created by Aldiyar Akhmediyev on 17.11.2022.
//

import Foundation


class CartViewModel: ObservableObject{
    
    @Published var cartItems = [CartItem]()
    @Published var total_cart_items_price: Float = 0
    @Published var total_cart_price: Float = 0
    @Published var tax: Float = 0
    @Published var pickingUp = true
    
    func getCartItems(){
        
        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "jsonwebtoken") else {
            return
        }
        
        CartWebService().getAllCartItems(token:token){ result in
            switch result{
            case .success(let cartItems):
                DispatchQueue.main.async {
                    self.cartItems = cartItems
                    
                    for item in cartItems{
                        self.total_cart_items_price += item.sum_price
                        self.tax += self.total_cart_items_price * 0.1
                        self.total_cart_price = self.total_cart_items_price + self.tax
                        if !self.pickingUp{
                            self.total_cart_price += 5
                        }
                    }
                }
            case .failure(let error):
                //self.loginAlert = true
                print(error.localizedDescription)
            }
        }
    }
    
    
}
