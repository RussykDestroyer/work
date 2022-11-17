//
//  Sidebar.swift
//  restaurant
//
//  Created by Aldiyar Akhmediyev on 16.11.2022.
//

import SwiftUI

struct Sidebar: View {
    @ObservedObject var homeData : HomeViewModel
    var body: some View{
        
        VStack {
            Button(action: {}, label: {
                
                HStack(spacing: 15){
                    
                    Image(systemName: "cart")
                        .font(.title)
                        .foregroundColor(Color.pink)
                    
                    Text("Cart")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Spacer(minLength: 0)
                }
                .padding()
            })
            
            Spacer()
            
            VStack{
                
                
                Text("Jalapenos Restaurant, st. Brooklyn, New York")
                    .fontWeight(.thin)
                    .font(.footnote)
                    .frame(maxWidth: 150)
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.23921568627450981, green: 0.2196078431372549, blue: 0.2196078431372549, opacity: 0.5)/*@END_MENU_TOKEN@*/)
                    .lineLimit(2)
                
                Text("+1 (347) 379 38 45")
                    .fontWeight(.thin)
                    .font(.footnote)
                    .frame(maxWidth: 150)
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.23921568627450981, green: 0.2196078431372549, blue: 0.2196078431372549, opacity: 0.5)/*@END_MENU_TOKEN@*/)
                    .lineLimit(1)
                
            }
            .padding(25)
            
            
        }
        .padding([.top, .trailing])
        .frame(width: UIScreen.main.bounds.width / 1.6)
        .background(Color.white.ignoresSafeArea())
    }
}
