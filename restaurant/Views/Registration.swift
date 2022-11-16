//
//  Registration.swift
//  restaurant
//
//  Created by Aldiyar Akhmediyev on 16.11.2022.
//

import Foundation
import SwiftUI


//Sign Up
struct signUp: View {
    
    @State var isAuthenticated: Bool = false
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirm_password = ""
    
    var body: some View {
                    
            ZStack {
                
                VStack {
                    
                    Spacer()
                    
                    Text("Create account")
                        .font(.title)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                    
                    TextField("Email", text: $email)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 1.0, saturation: 0.022, brightness: 0.923)/*@END_MENU_TOKEN@*/)
                        .cornerRadius(50)
                        .padding(.top, 10)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 1.0, saturation: 0.022, brightness: 0.923)/*@END_MENU_TOKEN@*/)
                        .cornerRadius(50)
                    
                    
                    SecureField("Confirm Password", text: $confirm_password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 1.0, saturation: 0.022, brightness: 0.923)/*@END_MENU_TOKEN@*/)
                        .cornerRadius(50)
                        .padding(.bottom, 16)
                    
                    
                    Button(action: {}, label: {
                        Text("Sign up")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding()
                            .frame(width: 300.0, height: 50)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 0.0, blue: 0.21176470588235294)/*@END_MENU_TOKEN@*/)
                            .cornerRadius(50)
                            .foregroundColor(.white)
                    })
                    
                    Text("By creating an account you are agree to our Terms and Conditions")
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                        .padding(.leading, 50)
                        .padding(.trailing, 50)
                    
                    Spacer()
                    
                    HStack {
                        
                        Text("Already have an account?")
                            .font(.footnote)
                        
                        Button(action: {}, label: {
                            Text("Sign in")
                                .font(.footnote)
                        })
                    } .padding()
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("sign").resizable().aspectRatio(contentMode: .fill)).ignoresSafeArea()
        }
}

