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
            
            HStack{
                
                Spacer()
                
                Text("Version 0.1")
                    .fontWeight(.bold)
                    .foregroundColor(Color.pink)
            }
            .padding(10)
        }
        .padding([.top, .trailing])
        .frame(width: UIScreen.main.bounds.width / 1.6)
        .background(Color.white.ignoresSafeArea())
    }
}
