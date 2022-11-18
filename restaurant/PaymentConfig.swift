//
//  PaymentConfig.swift
//  restaurant
//
//  Created by Aldiyar Akhmediyev on 18.11.2022.
//

import Foundation


class PaymentConfig {
    
    var paymentIntentClientSecret: String?
    static var shared: PaymentConfig = PaymentConfig()
    
    private init() { }
}
