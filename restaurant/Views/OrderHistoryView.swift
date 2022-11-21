//
//  orderHistory.swift
//  restaurant
//
//  Created by Russyk Destroyer on 21.11.2022.
//

import SwiftUI

struct OrderHistoryView: View {
    var body: some View {
        
         
            VStack {
                            
                //view order
                ScrollView(showsIndicators: false) {
                    ZStack {
                        VStack {
                            ForEach(1..<10){ _ in
                                VStack {
                                    
                                    HStack {
                                        Text("Order number: 1")
                                            .font(.caption)
                                            .fontWeight(.bold)
                                        Spacer()
                                    }
                                    .padding(.bottom, 5)
                                    
                                    HStack {
                                        Text("16 November 2022")
                                            .font(.caption)
                                            .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.428))
                                        
                                        Spacer()
                                    }
                                    
                                    Divider()
                                        .padding(.bottom, 5)
                                    
                                    HStack {
                                        Text("Total price:")
                                            .font(.caption)
                                        Text("$30.00")
                                            .fontWeight(.bold)
                                            .font(.caption)
                                            .foregroundColor(Color(red: 1.0, green: 0.0, blue: 0.212))
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        Text("Status:")
                                            .font(.caption)
                                        Text("Paid")
                                            .font(.caption)
                                        Spacer()
                                        
                                        Button(action: {}, label: {
                                            Text("View order")
                                                .padding(5)
                                                .foregroundColor(.white)
                                                .background(Color(red: 1.0, green: 0.0, blue: 0.0))
                                                .fontWeight(.bold)
                                                .cornerRadius(50)
                                        })
                                    }
                                }
                                .padding()
                                .background(.white)
                                .cornerRadius(30)
                            }
                            
                        }
                    }
                    .padding(.leading, 40)
                .padding(.trailing, 40)
                }
                Spacer()
                
            }
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.9607843137254902, green: 0.9607843137254902, blue: 0.9607843137254902)/*@END_MENU_TOKEN@*/)
        
        
    }
}

struct orderHistory_Previews: PreviewProvider {
    static var previews: some View {
        OrderHistoryView()
    }
}
