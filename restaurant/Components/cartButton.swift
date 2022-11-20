//
//  cartButton.swift
//  restaurant
//
//  Created by Russyk Destroyer on 18.11.2022.
//

import SwiftUI

struct cartButton: View {
    
    @Binding var cartItems: [CartItem]
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image("cartButton")
                .padding(.top, 5)
            
            if cartItems.count > 0 {
                Text("\(cartItems.count)")
                    .frame(width: 15, height: 15)
                    .padding(5)
                    .background(.red)
                    .cornerRadius(50)
                    .foregroundColor(.white)
            }
        }
    }
}

