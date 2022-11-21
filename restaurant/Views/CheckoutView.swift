//
//  CheckoutView.swift
//  restaurant
//
//  Created by Aldiyar Akhmediyev on 18.11.2022.
//

import SwiftUI
import Stripe

struct CheckoutView: View {
    @ObservedObject var CartVM: CartViewModel
    @StateObject var CheckoutVM = CheckoutViewModel()

    @State var buttonStatus = ""
    @State var paymentStatus: STPPaymentHandlerActionStatus?
    @State var isConfirmingPayment = false
    @State private var message: String = ""
    @State private var paymentMethodParams: STPPaymentMethodParams?
    let paymentGatewayController = PaymentGatewayController()
    
        
    private func pay() {
        
        guard let clientSecret = PaymentConfig.shared.paymentIntentClientSecret else {
            return
        }
        
        let paymentIntentParams = STPPaymentIntentParams(clientSecret: clientSecret)
        paymentIntentParams.paymentMethodParams = paymentMethodParams
        
        paymentGatewayController.submitPayment(intent: paymentIntentParams) { status, intent, error in
            
            switch status {
                case .failed:
                    paymentStatus = .failed
                    buttonStatus = "completed"
                case .canceled:
                    paymentStatus = .canceled
                    buttonStatus = "completed"
                case .succeeded:
                    paymentStatus = .succeeded
                    buttonStatus = "completed"
                    CheckoutVM.confirm_order { _ in
                        print("order confirmed in database")
                    }
                    CartVM.getCartItems()
            }
            
        }
        
    }

    var body: some View {
        VStack{
            
            ZStack{
                VStack {
                    
                        Section {
                            // Stripe Credit Card TextField Here
                            STPPaymentCardTextField.Representable.init(paymentMethodParams: $paymentMethodParams)
                        } header: {
                            Text("Payment Information")
                                .font(.system(size: 15))
                                .fontWeight(.bold)
                        }
                        .padding()
                    
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
                    .frame(maxHeight: .infinity, alignment: .top)
                    .padding()
                    .padding(.horizontal, 40)
                    .background(.white)
                    
                    if buttonStatus == "" {
                        Button(action: {
                            isConfirmingPayment = true
                            buttonStatus = "in progress"

                            CheckoutVM.startCheckout(){ clientSecret in
                                
                                PaymentConfig.shared.paymentIntentClientSecret = clientSecret
                                
                                self.pay()
                                
                            }
                        }, label: {
                            Text("Pay")
                                .font(.system(size: 15))
                                .fontWeight(.bold)
                                .foregroundColor(Color(hexStringToUIColor(hex: "#3D3838")))
                        })
                        .disabled(isConfirmingPayment)
                        .frame(maxWidth: 100, maxHeight: 40)
                        .background(Color(hexStringToUIColor(hex: "FFD9E1")))
                        .cornerRadius(25)
                        .padding()
                    }
                    else if buttonStatus == "in progress" {
                        ProgressView()
                            .padding()
                    }
                    else if buttonStatus == "completed"{
                        if let paymentStatus = paymentStatus {
                            HStack {
                                switch paymentStatus {
                                case .succeeded:
                                    HStack{
                                        Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
                                        Text("Payment complete!")
                                    }
                                    .padding()
                                case .failed:
                                    HStack{
                                        Image(systemName: "xmark.octagon.fill").foregroundColor(.red)
                                        Text("Payment failed! \(CheckoutVM.lastPaymentError ?? NSError())")
                                    }
                                    .padding()
                                case .canceled:
                                    HStack{
                                        Image(systemName: "xmark.octagon.fill").foregroundColor(.orange)
                                        Text("Payment canceled.")
                                    }
                                    .padding()

                                @unknown default:
                                        Text("Unknown status")
                                                                }
                            }
                        }
                    }
                        
                        
                    }
            }
        }
        .frame(height: 400)
        .background(Color.white.ignoresSafeArea())
        .navigationBarTitle("")
        .navigationBarHidden(true)
        
            
//            NavigationLink(isActive: $isSuccess, destination: {
//                Home()
//
//            }, label: {
////                if (isSuccess){
////                    Button(action: {}, label: {
////                        Text("Return to home")
////                            .font(.system(size: 15))
////                            .fontWeight(.bold)
////                            .foregroundColor(.black)
////                    })
////                    .frame(maxWidth: .infinity)
////                    .padding(.horizontal, 40)
////                }
//            })
            
        }
    }

//struct CheckoutView_Previews: PreviewProvider {
//    @State var showCheckout = true
//    
//    static var previews: some View {
//        CheckoutView(showCheckout: $showCheckout)
//    }
//}



