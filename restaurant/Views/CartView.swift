//
//  Cart.swift
//  restaurant
//
//  Created by Aldiyar Akhmediyev on 16.11.2022.
//

import Foundation
import SwiftUI


struct CartView: View{
    
    @ObservedObject var CartVM: CartViewModel
    
    @State var showCheckout: Bool = false
    
    @State var animationAmount = 1.0

    var body: some View{
        NavigationView{
            
            ZStack{
                VStack{
                    
                    Toggle(isOn: $CartVM.pickingUp){
                        Text("Picking up")
                            .frame(alignment: .trailing)
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    .frame(alignment: .center)
                    .padding(.top, 15)
                    .padding(.horizontal, 30)
                    
                    
                    ScrollView(.vertical){
                        VStack(spacing:0){
                            VStack(alignment: .leading, spacing:0){
                                
                                CartItemsDisplay
                                
                            }
                            .padding()
                            .padding(.horizontal, 25)
                            .background(Color(hexStringToUIColor(hex: "#F5F5F5")))
                            
                            Spacer()
                            
                            Divider()
                                .frame(height:2.0)
                                .overlay(.gray)
                                .padding(0)
                            
                            
                            
                            VStack(alignment: .leading, spacing:10){
                                HStack{
                                    Text("Sub Total:")
                                        .font(.system(size: 12))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(hexStringToUIColor(hex: "#A8A8A8")))
                                    
                                    Spacer()
                                    
                                    Text("$" + String(format: "%.2f", CartVM.total_cart_items_price))
                                        .font(.system(size: 12))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(hexStringToUIColor(hex: "#FF0036")))
                                }
                                
                                HStack{
                                    Text("Tax:")
                                        .font(.system(size: 12))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(hexStringToUIColor(hex: "#A8A8A8")))
                                    
                                    Spacer()
                                    
                                    Text("$" + String(format: "%.2f", CartVM.tax))
                                        .font(.system(size: 12))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(hexStringToUIColor(hex: "#FF0036")))
                                }
                                
                                if !CartVM.pickingUp{
                                    
                                    HStack{
                                        Text("Shipping:")
                                            .font(.system(size: 12))
                                            .fontWeight(.bold)
                                            .foregroundColor(Color(hexStringToUIColor(hex: "#A8A8A8")))
                                        
                                        Spacer()
                                        
                                        Text("$5")
                                            .font(.system(size: 12))
                                            .fontWeight(.bold)
                                            .foregroundColor(Color(hexStringToUIColor(hex: "#FF0036")))
                                    }
                                }
                                
                                Divider()
                                    .frame(height:0.6)
                                    .overlay(.gray)
                                    .padding(.vertical, 20)
                                
                                HStack{
                                    Text("Shopping Cart Total:")
                                        .font(.system(size: 15))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(hexStringToUIColor(hex: "#3D3838")))
                                    
                                    Spacer()
                                    
                                    Text("$" + String(format: "%.2f", CartVM.total_cart_price))
                                        .font(.system(size: 15))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(hexStringToUIColor(hex: "#FF0036")))
                                }
                            }
                            .frame(minHeight: 350, maxHeight: .infinity, alignment: .top)
                            .padding(.top, 25)
                            .padding(.horizontal, 40)
                            .background(.white)
                            
                            Divider()
                                .frame(height:2.0)
                                .overlay(.gray)
                                .padding(0)
                        }
                        
                    }
                    .ignoresSafeArea()
                    
                }
                .background(Color(hexStringToUIColor(hex: "#F5F5F5")))
                .overlay(ConfirmationButton, alignment: .bottom)
                
                
                if showCheckout{
                    CheckoutView()
                        .frame(height: UIScreen.main.bounds.height)
                        .transition(.asymmetric(
                            insertion: .move(edge: .bottom),
                            removal: AnyTransition.opacity.animation(.easeInOut)))
                        .animation(.easeInOut, value: animationAmount)
                }
            }
            
            
        }
    }
    
    var PaymentMethodAndLocation: some View {
                            HStack( spacing: 0){
        
                                VStack(alignment: .leading, spacing: 0){
                                    HStack{
                                        Image(systemName: "creditcard")
                                            .foregroundColor(Color(hexStringToUIColor(hex: "#3D383880")))
        
                                        Text("Cash")
                                            .font(.custom("SF Pro Display", size: 12))
                                            .foregroundColor(Color(hexStringToUIColor(hex: "#3D383880")))
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(15)
        
                                    Divider()
                                        .frame(height:0.8)
                                        .overlay(.gray)
        
                                    HStack{
                                        Image(systemName: "location")
                                            .foregroundColor(Color(hexStringToUIColor(hex: "#3D383880")))
        
                                        Text("Entered address")
                                            .font(.custom("SF Pro Display", size: 12))
                                            .foregroundColor(Color(hexStringToUIColor(hex: "#3D383880")))
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(15)
        
                                }
                                .frame(minWidth: 300)
                                .background(.white)
                                .cornerRadius(25)
                                //                    .overlay(
                                //                        RoundedRectangle(cornerRadius: 25)
                                //                            .stroke(Color(hexStringToUIColor(hex: "#CDCDCD")), lineWidth: 1)
                                //
                                //                    )
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 30)
                            .padding(.vertical, 20)
    }
    
    var CartItemsDisplay: some View {
        ForEach(CartVM.cartItems, id: \.id){cartItem in
            HStack{
                VStack(spacing: 0) {
                    Button(action: {CartVM.IncrementCartItem(id: cartItem.dish.id)}, label: {
                        Image(systemName: "plus")
                            .foregroundColor(Color(hexStringToUIColor(hex: "#CDCDCD")))
                    })
                    .frame(width: 60, height: 40)
                    .background(.white)
                    .cornerRadius(10)
                    
                    //                            Divider()
                    //                                .frame(width: 60, height: 0.8)
                    //                                .overlay(.gray)
                    
                    Text(String(cartItem.count))
                        .frame(width: 60, height: 40)
                        .background(.white)
                    
                    //                            Divider()
                    //                                .frame(width: 60, height: 0.8)
                    //                                .overlay(.gray)
                    
                    Button(action: {CartVM.DecrementCartItem(id: cartItem.dish.id)}, label: {
                        Image(systemName: "minus")
                            .foregroundColor(Color(hexStringToUIColor(hex: "#CDCDCD")))
                    })
                    .frame(width: 60, height: 40)
                    .background(.white)
                    .cornerRadius(10)
                }
                .background(.white)
                .cornerRadius(10)
                
                //                        .overlay(
                //                            RoundedRectangle(cornerRadius: 10)
                //                                .stroke(Color(hexStringToUIColor(hex: "#CDCDCD")), lineWidth: 1)
                //                        )
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 0, content: {
                    Text(cartItem.dish.name)
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                        .foregroundColor(Color(hexStringToUIColor(hex: "#3D3838")))
                    
                    
                    Text(cartItem.dish.description ?? "no description")
                        .frame(maxWidth: 150, alignment: .leading)
                        .font(.custom("SF Pro Display", size: 12))
                        .foregroundColor(Color(hexStringToUIColor(hex: "#A8A8A8")))
                    
                    
                    Text("$\(String(format: "%.2f", cartItem.sum_price))")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Color(hexStringToUIColor(hex: "#FF0036")))
                })
                .frame(width: 190, height: 120, alignment: .center)
                //                        .overlay(
                //                            RoundedRectangle(cornerRadius: 20)
                //                                .stroke(Color(hexStringToUIColor(hex: "#CDCDCD")), lineWidth: 1)
                //                        )
                .background(.white)
                .cornerRadius(20)
                .shadow(color: .gray, radius: 5)
            }
            .background(Color(hexStringToUIColor(hex: "#F5F5F5")))
            
            Divider()
                .frame(height:0.6)
                .overlay(.gray)
                .padding(.vertical, 20)
            
            
            
        }
    }
    
    var ConfirmationButton: some View {
        VStack(alignment: .leading, spacing: 15) {
            NavigationLink(destination: CheckoutView(), isActive: $CartVM.isActive, label: {
                Button(action: {
                    CartVM.startCheckout{ clientSecret in
                        
                        PaymentConfig.shared.paymentIntentClientSecret = clientSecret
                        DispatchQueue.main.async {
                            CartVM.isActive = true
                        }
                    }
                }, label: {
                    HStack(spacing: 0, content: {
                        Text("Checkout ")
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .foregroundColor(Color(hexStringToUIColor(hex: "#3D3838")))
                        Text("$" + String(format: "%.2f", CartVM.total_cart_price))
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .foregroundColor(Color(hexStringToUIColor(hex: "#FF0036")))
                    })
                })
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color(hexStringToUIColor(hex: "FFD9E1")))
                .cornerRadius(25)
            })
        }
        .frame(minWidth: 300, alignment: .bottom)
        .padding(25)
    }
}


struct DeliveryTypeView: View{
    var body: some View{
        VStack(alignment: .leading, spacing: 15, content: {

//            Text("Delivery type")
//                .font(.system(size: 15))
//                .fontWeight(.bold)
//                .foregroundColor(Color(hexStringToUIColor(hex: "#3D3838")))
//                .frame(maxWidth: .infinity, alignment: .leading)

            Button(action: {}, label: {
                HStack(spacing: 0, content: {
                    Text("Shipping to: ")
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                        .foregroundColor(Color(hexStringToUIColor(hex: "#3D3838")))
                    Text("user address")
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                        .foregroundColor(Color(hexStringToUIColor(hex: "#3D383880")))
                })
            })
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(.white)
            .cornerRadius(25)
            .shadow(color: .gray, radius: 5)

            Button(action: {}, label: {
                Text("Pick up")
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                    .foregroundColor(Color(hexStringToUIColor(hex: "#3D3838")))
            })
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(.white)
            .cornerRadius(25)
            .shadow(color: .gray, radius: 5)
        })
        .frame(minWidth: 300, alignment: .bottom)
        .padding(25)
    }
}


struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(CartVM: CartViewModel())
    }
}
