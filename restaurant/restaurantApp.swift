//
//  restaurantApp.swift
//  restaurant
//
//  Created by Russyk Destroyer on 15.11.2022.
//

import SwiftUI
import StripeCore

@main
struct restaurantApp: App {
    init(){
        StripeAPI.defaultPublishableKey = "pk_test_51M5P8hEoAlAQlgS0iwHakJmykieGfCujrrm1rRMeADTqv44jTUdMpkBGNXczLAHo0RotbWxm3aBhzoPCJ27UTGY100xlDT0MfE"
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
