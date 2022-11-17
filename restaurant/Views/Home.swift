//
//  Home.swift
//  restaurant
//
//  Created by Aldiyar Akhmediyev on 16.11.2022.
//

import SwiftUI
import SlidingTabView

struct Home: View {
    
    @State private var tabIndex = 0
    
    @StateObject var HomeModel = HomeViewModel()
    @State var animationAmount = 1.0
    var body: some View {
        
        ZStack{
            
            //navigation
            VStack(){
                
                HStack(){
                    
                    Button(action: {
                        withAnimation(.easeIn){HomeModel.showMenu.toggle()}
                    }, label: {
                        Image("menuButton")
                            .resizable()
                            .frame(width: 35, height: 35)
                        
                    })
                    
                    HStack {
                        Image(systemName: "location")
                            .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 1.0, green: 0.0, blue: 0.212)/*@END_MENU_TOKEN@*/)
                            .padding(.leading, 16)
                        
                        Text(HomeModel.userLocation == nil ? "" : "")
                            .foregroundColor(.black)
                        
                        Text(HomeModel.userAddress)
                            .font(.caption)
                            .fontWeight(.heavy)
                            .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.23921568627450981, green: 0.2196078431372549, blue: 0.2196078431372549, opacity: 0.5)/*@END_MENU_TOKEN@*/)
                            .padding(.trailing, 50)
                        
                        Spacer(minLength: 0)
                    }
                }
                
                .padding([.horizontal, .top])
                .padding(.bottom, 10)
                
                Text("Menu")
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 1.0, green: 0.0, blue: 0.212)/*@END_MENU_TOKEN@*/)
                    .padding(.trailing, 280)
                    .padding(.bottom, 10)
                    .fontWeight(.bold)
                    .font(.title)
                
                HStack(){
                    
                    TextField("Search for a food item", text: $HomeModel.search)
                        .frame(maxWidth: .infinity, maxHeight: 40)
                        .padding(.leading, 25)
                        .background(.white)
                        .cornerRadius(50)
                    
                    
                    
                    if HomeModel.search != "" {
                        
                        Button(action: {}, label: {
                            
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .frame(maxWidth: 20, maxHeight: 20)
                                .foregroundColor(.gray)
                            
                        })
                        .animation(Animation.easeIn, value: animationAmount)
                    }
                }
                .padding(.horizontal)
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .padding(.bottom, 10)
                
                ScrollView(.vertical) {
                    
                    Text("Categories")
                        .foregroundColor(Color(red: 0.23921568627450981, green: 0.2196078431372549, blue: 0.2196078431372549))
                        .padding(.trailing, 240)
                        .fontWeight(.bold)
                        .font(.title2)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                                                
                        HStack {
                            Button(action: {}, label: {
                                Image("breakfastOff")
                            })
                            Button(action: {}, label: {
                                Image("nachosOff")
                            })
                            Button(action: {}, label: {
                                Image("tacoOff")
                            })
                            Button(action: {}, label: {
                                Image("nachosOff")
                            })
                            Button(action: {}, label: {
                                Image("platosOff")
                            })
                            Button(action: {}, label: {
                                Image("soupsOff")
                            })
                            Button(action: {}, label: {
                                Image("saladsOff")
                            })
                            Button(action: {}, label: {
                                Image("drinksOff")
                            })
                            Button(action: {}, label: {
                                Image("cocktailsOff")
                            })

                        }
                        .padding(.trailing, 20)
                        .padding(.leading, 20)
                        
                    }
                    
                    Text("Breakfast")
                        .foregroundColor(Color(red: 0.23921568627450981, green: 0.2196078431372549, blue: 0.2196078431372549))
                        .padding(.trailing, 250)
                        .fontWeight(.bold)
                        .font(.title2)
                    
                    Spacer()
                    
                }
                
                
                HStack {
                    Button(action: {}, label: {
                        Text("-")
                    })
                        .opacity(0)
                    
                    
                    Spacer()
                    
                    
                    Button(action: {}, label: {
                        
                        Image("cartButton")
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding(.trailing, 30)
                
                
            }
            
            // Side menu
            
            HStack{
                
                Sidebar(homeData: HomeModel)
                    // Move effect from left
                    .offset(x: HomeModel.showMenu ? 0 : -UIScreen.main.bounds.width / 1.6)
                
                Spacer(minLength: 0)
            }
            .background(
                Color.black.opacity(HomeModel.showMenu ? 0.3 : 0).ignoresSafeArea()
                // closing when Taps on outside... 
                    .onTapGesture(perform: {
                        withAnimation(.easeIn){HomeModel.showMenu.toggle()}
                    })
            )
            
            // Non Closable Alert If Permission Denied...
            
            if HomeModel.noLocation{
                Text("Please Enable Location Access In Settings To Further Move On!!!")
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width - 100, height: 120)
                    .background(Color.white)
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.3).ignoresSafeArea())
            }
        }
        
        .onAppear(perform: {
            
            // calling locatin delegate
            HomeModel.locationManager.delegate = HomeModel
        })
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.9607843137254902, green: 0.9607843137254902, blue: 0.9607843137254902)/*@END_MENU_TOKEN@*/)
    }
}
