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
    @Published var isActive = false
    
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
    
    func IncrementCartItem(id :Int){
        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "jsonwebtoken") else {
            return
        }
        
        CartWebService().IncrementCartItem(token:token, id:id){ result in
            switch result{
            case .success(let cartItem):
                DispatchQueue.main.async {
                    if let idx = self.cartItems.firstIndex(where: { $0.id == cartItem.id }) {
                        self.cartItems[idx] = cartItem
                    }
                    else{
                        self.cartItems.append(cartItem)
                    }
                    
                    self.total_cart_items_price = 0
                    self.tax = 0
                    for item in self.cartItems{
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
    
    func DecrementCartItem(id :Int){
        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "jsonwebtoken") else {
            return
        }
        
        CartWebService().DecrementCartItem(token:token, id:id){ result in
            switch result{
            case .success(let cartItem):
                DispatchQueue.main.async {
                    if let idx = self.cartItems.firstIndex(where: { $0.id == cartItem.id }) {
                        if cartItem.count == 0{
                            self.cartItems.remove(at: idx)                        }
                        else{
                            self.cartItems[idx] = cartItem
                        }
                        
                    }
                    else{
                        self.cartItems.append(cartItem)
                    }
                    
                    self.total_cart_items_price = 0
                    self.tax = 0
                    for item in self.cartItems{
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
    
    func startCheckout(completion: @escaping (String?) -> Void){
        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "jsonwebtoken") else {
            return
        }
        
        let url = URL(string: "http://localhost:8000/api/order/create-payment-intent/")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            
            guard let data = data, error == nil,
                  (response as? HTTPURLResponse)?.statusCode == 200
            else{
                completion(nil)
                return
            }
            
            let checkoutIntentResponse = try?
                JSONDecoder().decode(CheckoutIntentResponse.self, from: data)
            completion(checkoutIntentResponse?.clientSecret)
            
        }.resume()
    }
    
}
