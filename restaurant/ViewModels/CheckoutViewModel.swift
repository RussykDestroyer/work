//
//  CheckoutViewModel.swift
//  restaurant
//
//  Created by Aldiyar Akhmediyev on 18.11.2022.
//

import Foundation
import Stripe

class CheckoutViewModel: ObservableObject{
    @Published var paymentIntentParams: STPPaymentIntentParams?
    @Published var lastPaymentError: NSError?


    
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
            
            self.paymentIntentParams = STPPaymentIntentParams(clientSecret: checkoutIntentResponse!.clientSecret)
            
            completion(checkoutIntentResponse?.clientSecret)
            
        }.resume()
    }
    
    func confirm_order(completion: @escaping (String?) -> Void){
        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "jsonwebtoken") else {
            return
        }
        
        let url = URL(string: "http://localhost:8000/api/order/confirm-order/")!
        
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
            
           print(data)
            
        }.resume()
    }

}
