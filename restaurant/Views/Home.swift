//
//  Home.swift
//  restaurant
//
//  Created by Aldiyar Akhmediyev on 16.11.2022.
//

import SwiftUI
import SlidingTabView


struct Home: View {
    @StateObject var CartVM = CartViewModel()
    @StateObject var HomeVM = HomeViewModel()
    
    @State private var numb = 0
    @State private var tabIndex = 0
    
    @State var animationAmount = 1.0
    
    @State var outCategory = ""
    
    
    var body: some View {
        
        CustomNavView{
            
            ZStack{
                
                //navigation
                VStack(){
                    
                    Header
                    
                    Text("Menu")
                        .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 1.0, green: 0.0, blue: 0.212)/*@END_MENU_TOKEN@*/)
                        .padding(.trailing, 280)
                        .padding(.bottom, 10)
                        .fontWeight(.bold)
                        .font(.title)
                    
                    Search
                    
                    ScrollView(.vertical) {
                        
                        Text("Categories")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .foregroundColor(Color(red: 0.23921568627450981, green: 0.2196078431372549, blue: 0.2196078431372549))
                            .fontWeight(.bold)
                            .font(.title2)
                        
                        CategoriesScrollView
                        
                        Text(outCategory)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .textCase(.uppercase)
                            .foregroundColor(Color(red: 0.23921568627450981, green: 0.2196078431372549, blue: 0.2196078431372549))
                            .padding()
                            .fontWeight(.bold)
                            .font(.title2)
                        
                        if outCategory != ""{
                            DishesWithCategory
                        }
                        else {
                            AllDishes
                        }
                
                        Spacer()
                        
                    }
                    
                }
                .overlay(ShoppingCartButton, alignment: .bottomTrailing)
                
                // Side menu
                
                HStack{
                    
                    Sidebar(homeData: HomeVM)
                    // Move effect from left
                        .offset(x: HomeVM.showMenu ? 0 : -UIScreen.main.bounds.width / 1.6)
                    
                    Spacer(minLength: 0)
                }
                .background(
                    Color.black.opacity(HomeVM.showMenu ? 0.3 : 0).ignoresSafeArea()
                    // closing when Taps on outside...
                        .onTapGesture(perform: {
                            withAnimation(.easeIn){HomeVM.showMenu.toggle()}
                        })
                )
                
                // Non Closable Alert If Permission Denied...
                
                if HomeVM.noLocation{
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
                HomeVM.locationManager.delegate = HomeVM
                
            })
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.9607843137254902, green: 0.9607843137254902, blue: 0.9607843137254902)/*@END_MENU_TOKEN@*/)
            .customNavigationBarHidden(true)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
    
    var Header: some View{
        HStack(){
            
            Button(action: {
                withAnimation(.easeIn){HomeVM.showMenu.toggle()}
            }, label: {
                Image("menuButton")
                    .resizable()
                    .frame(width: 35, height: 35)
                
            })
            
            HStack {
                Image(systemName: "location")
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 1.0, green: 0.0, blue: 0.212)/*@END_MENU_TOKEN@*/)
                    .padding(.leading, 16)
                
                Text(HomeVM.userLocation == nil ? "" : "")
                    .foregroundColor(.black)
                
                Text(HomeVM.userAddress)
                    .font(.caption)
                    .fontWeight(.heavy)
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.23921568627450981, green: 0.2196078431372549, blue: 0.2196078431372549, opacity: 0.5)/*@END_MENU_TOKEN@*/)
                    .padding(.trailing, 50)
                
                Spacer(minLength: 0)
            }
        }
        
        .padding([.horizontal, .top])
        .padding(.bottom, 10)


    }
    
    var Search: some View{
        HStack(){
            
            TextField("Search for a food item", text: $HomeVM.search)
                .frame(maxWidth: .infinity, maxHeight: 40)
                .padding(.leading, 25)
                .background(.white)
                .cornerRadius(50)
            
            
            
            if HomeVM.search != "" {
                
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
    }
   
    var CategoriesScrollView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack {
                Button(action: {outCategory = "breakfasts"}, label: {
                    if outCategory == "breakfasts"{
                        Image("breakfastOn")
                    }
                    else {
                        Image("breakfastOff")
                    }
                })
                Button(action: {outCategory = "nachos"}, label: {
                    if outCategory == "nachos"{
                        Image("nachosOn")
                    }
                    else {
                        Image("nachosOff")
                    }
                })
                Button(action: {outCategory = "tacos"}, label: {
                    if outCategory == "tacos"{
                        Image("tacosOn")
                    }
                    else {
                        Image("tacosOff")
                    }
                })
                Button(action: {outCategory = "platos"}, label: {
                    if outCategory == "platos"{
                        Image("platosOn")
                    }
                    else {
                        Image("platosOff")
                    }
                })
                Button(action: {outCategory = "soups"}, label: {
                    if outCategory == "soups"{
                        Image("soupsOn")
                    }
                    else {
                        Image("soupsOff")
                    }
                })
                Button(action: {outCategory = "salads"}, label: {
                    if outCategory == "salads"{
                        Image("saladsOn")
                    }
                    else {
                        Image("saladsOff")
                    }
                })
                Button(action: {outCategory = "drinks"}, label: {
                    if outCategory == "drinks"{
                        Image("drinksOn")
                    }
                    else {
                        Image("drinksOff")
                    }
                })
                Button(action: {outCategory = "cocktails"}, label: {
                    if outCategory == "cocktails"{
                        Image("cocktailsOn")
                    }
                    else {
                        Image("cocktailsOff")
                    }
                })
                
            }
            .frame(height: 100)
            .padding(.trailing, 20)
            .padding(.leading, 20)
        }
    }
    
    var DishesWithCategory: some View{
        ForEach(HomeVM.dishes.filter{$0.category?.name == outCategory}, id: \.id){dish in
            HStack {
                
                HStack {
                    
                    VStack (alignment: .leading){
                        Text(dish.name)
                            .textCase(.uppercase)
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(.bottom, 1)
                            .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.23921568627450981, green: 0.2196078431372549, blue: 0.2196078431372549)/*@END_MENU_TOKEN@*/)
                        
                        Text(dish.description ?? "no description")
                            .textCase(.lowercase)
                            .frame(width: 120, alignment: .leading)
                            .font(.caption)
                            .foregroundColor(Color(red: 0.6588235294117647, green: 0.6588235294117647, blue: 0.6588235294117647))
                            .multilineTextAlignment(.leading)
                            .lineLimit(3)
                            .padding(.bottom, 1)
                        
                        
                        Text("$" + String(format: "%.1f", dish.price))
                            .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.23921568627450981, green: 0.2196078431372549, blue: 0.2196078431372549)/*@END_MENU_TOKEN@*/)
                            .fontWeight(.bold)
                        
                        
                    }
                    .padding(20)
                    
                    
                    Spacer()
                    
                    VStack {
                        Button(action: {
                            CartVM.IncrementCartItem(id: dish.id)
                        }, label: {
                            Image("addCart")
                        })
                        
                        Spacer()
                    }
                    .padding(.top, 20)
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
    
    var AllDishes: some View{
        ForEach(HomeVM.dishes, id: \.id){dish in
            HStack {
                
                HStack {
                    
                    VStack (alignment: .leading){
                        Text(dish.name)
                            .textCase(.uppercase)
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(.bottom, 1)
                            .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.23921568627450981, green: 0.2196078431372549, blue: 0.2196078431372549)/*@END_MENU_TOKEN@*/)
                        
                        Text(dish.description ?? "no description")
                            .textCase(.lowercase)
                            .frame(width: 120, alignment: .leading)
                            .font(.caption)
                            .foregroundColor(Color(red: 0.6588235294117647, green: 0.6588235294117647, blue: 0.6588235294117647))
                            .multilineTextAlignment(.leading)
                            .lineLimit(3)
                            .padding(.bottom, 1)
                        
                        
                        Text("$" + String(format: "%.1f", dish.price))
                            .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.23921568627450981, green: 0.2196078431372549, blue: 0.2196078431372549)/*@END_MENU_TOKEN@*/)
                            .fontWeight(.bold)
                        
                        
                    }
                    .padding(20)
                    
                    
                    Spacer()
                    
                    VStack {
                        Button(action: {
                            CartVM.IncrementCartItem(id: dish.id)
                        }, label: {
                            Image("addCart")
                        })
                        
                        Spacer()
                    }
                    .padding(.top, 20)
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
    
    var ShoppingCartButton: some View {
        CustomNavLink(destination:
            CartView(CartVM: CartVM)
                .customNavigationTitle("Shopping Cart")
        ){
            ZStack(alignment: .topTrailing) {
                Image("cartButton")
                    .padding(.top, 5)
                
                if CartVM.cartItems.count > 0 {
                    Text("\(CartVM.cartItems.count)")
                        .frame(width: 15, height: 15)
                        .padding(5)
                        .background(.red)
                        .cornerRadius(50)
                        .foregroundColor(.white)
                }
            }
                .padding(.horizontal, 30)
        }
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
