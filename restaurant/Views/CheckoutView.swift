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
                CheckoutVM.confirm_order { _ in
                    print("order confirmed in database")
                }
            }
            
        }
        
    }

    var body: some View {
        VStack {
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
                
                
            }
            
            NavigationLink(isActive: $isSuccess, destination: {
                //Confirmation()
            }, label: {
                EmptyView()
            })
            
            
            .navigationTitle("Checkout")
            
        }
    }



