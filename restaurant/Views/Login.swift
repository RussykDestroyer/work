//
//  Login.swift
//  restaurant
//
//  Created by Aldiyar Akhmediyev on 16.11.2022.
//

import Foundation
import SwiftUI

//Sign In
struct signIn: View {
    
    @StateObject private var loginVM = LoginViewModel()
    
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        
        ZStack {
            
            VStack {
                
                Spacer()
                
                Text("Sign In")
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                
                TextField("Username", text: $loginVM.username)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 1.0, saturation: 0.022, brightness: 0.923)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(50)

                
                SecureField("Password", text: $loginVM.password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 1.0, saturation: 0.022, brightness: 0.923)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(50)
                    .padding(.bottom, 16)

                
                Button(action: {
                    loginVM.login()
                }, label: {
                    Text("Sign in")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 0.0, blue: 0.212)/*@END_MENU_TOKEN@*/)
                        .cornerRadius(50)
                        .foregroundColor(.white)
                })
                
                Spacer()
                
                HStack {
                    
                    Text("Don't have an account?")
                        .font(.footnote)
                    
                    Button(action: {}, label: {
                        Text("Sign up")
                            .font(.footnote)
                    })
                } .padding()
                                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("sign").resizable().aspectRatio(contentMode: .fill)).ignoresSafeArea()
    }
}
