//
//  CheckoutView.swift
//  restaurant
//
//  Created by Aldiyar Akhmediyev on 18.11.2022.
//

import SwiftUI
import Stripe

struct CheckoutView: View {
    
    @State private var message: String = ""
    @State private var isSuccess: Bool = false
    @State private var paymentMethodParams: STPPaymentMethodParams?
    let paymentGatewayController = PaymentGatewayController()
    @StateObject var CheckoutVM = CheckoutViewModel()
    
        
    private func pay() {
        
        guard let clientSecret = PaymentConfig.shared.paymentIntentClientSecret else {
            return
        }
        
        let paymentIntentParams = STPPaymentIntentParams(clientSecret: clientSecret)
        paymentIntentParams.paymentMethodParams = paymentMethodParams
        
        paymentGatewayController.submitPayment(intent: paymentIntentParams) { status, intent, error in
            
            switch status {
                case .failed:
                    message = "Failed"
                case .canceled:
                    message = "Cancelled"
                case .succeeded:
                    message = "Your payment has been successfully completed!"
                isSuccess = true
                CheckoutVM.confirm_order { _ in
                    print("order confirmed in database")
                }
            }
            
        }
        
    }

    var body: some View {
        VStack {
            Spacer()
                Section {
                    // Stripe Credit Card TextField Here
                    STPPaymentCardTextField.Representable.init(paymentMethodParams: $paymentMethodParams)
                } header: {
                    Text("Payment Information")
                }
                
                HStack {
                    Spacer()
                    Button("Pay") {
                        pay()
                    }.buttonStyle(.plain)
                    Spacer()
                }
                
                Text(message)
                    .font(.headline)
            
            Spacer()
                
                
            }
            
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
            
            
            .navigationBarTitle("")
            .navigationBarHidden(true)
            
        }
    }

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}



