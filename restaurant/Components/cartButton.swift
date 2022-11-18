//
//  cartButton.swift
//  restaurant
//
//  Created by Russyk Destroyer on 18.11.2022.
//

import SwiftUI

struct cartButton: View {
    
    var numberOfProducts: Int
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image("cartButton")
                .padding(.top, 5)
            
            if numberOfProducts > 0 {
                Text("\(numberOfProducts)")
                    .frame(width: 15, height: 15)
                    .padding(5)
                    .background(.red)
                    .cornerRadius(50)
                    .foregroundColor(.white)
            }
        }
    }
}

struct cartButton_Previews: PreviewProvider {
    static var previews: some View {
        cartButton(numberOfProducts: 1)
    }
}
