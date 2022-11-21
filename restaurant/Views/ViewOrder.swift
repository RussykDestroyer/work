//
//  ViewOrder.swift
//  restaurant
//
//  Created by Russyk Destroyer on 21.11.2022.
//

import SwiftUI

struct ViewOrder: View {
    var body: some View {
        
        ScrollView {
            
            HStack {
                
                HStack {
                    
                    VStack (alignment: .leading){
                        Text("asd")
                            .textCase(.uppercase)
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(.bottom, 1)
                            .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.23921568627450981, green: 0.2196078431372549, blue: 0.2196078431372549)/*@END_MENU_TOKEN@*/)
                        
                        Text("asd")
                            .textCase(.lowercase)
                            .frame(width: 120, alignment: .leading)
                            .font(.caption)
                            .foregroundColor(Color(red: 0.6588235294117647, green: 0.6588235294117647, blue: 0.6588235294117647))
                            .multilineTextAlignment(.leading)
                            .lineLimit(3)
                            .padding(.bottom, 1)
                        
                        
                        Text("$")
                            .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.23921568627450981, green: 0.2196078431372549, blue: 0.2196078431372549)/*@END_MENU_TOKEN@*/)
                            .fontWeight(.bold)
                        
                        
                    }
                    .padding(20)
                    
                    
                    Spacer()
                    
                    VStack {
                        
                        Spacer()
                        
                        Text("1")
                        
                        Spacer()
                    }
                    .padding(.trailing, 10)
                    
                }
                .background(.white)
                .cornerRadius(20)
                .shadow(radius: 5)
                
            }
            .frame(maxWidth: .infinity)
            .padding(.leading, 30)
            .padding(.trailing, 30)
            .padding(.bottom, 30)
            
        }
        
    }
}


struct ViewOrder_Previews: PreviewProvider {
    static var previews: some View {
        ViewOrder()
    }
}
