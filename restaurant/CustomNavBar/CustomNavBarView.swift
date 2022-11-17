//
//  CustomNavBarView.swift
//  restaurant
//
//  Created by Aldiyar Akhmediyev on 17.11.2022.
//

import SwiftUI

struct CustomNavBarView: View {
    
    @Environment(\.presentationMode) var presentationMode
    let showBackButton: Bool
    let showNavBar: Bool
    let title: String
    var body: some View {
        if showNavBar{
            
            HStack{
                if showBackButton {
                    backButton
                        .foregroundColor(Color(hexStringToUIColor(hex: "#00000080")))
                        .frame(alignment: .leading)
                        .padding()
                    
                }
                
                Spacer()
                
                titleSection
                
                Spacer()
                
                if showBackButton{
                    backButton
                        .frame(alignment: .leading)
                        .padding()
                        .opacity(0)
                    
                }
            }
            .font(.headline)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 25)
            .background(Color(hexStringToUIColor(hex: "#F5F5F5")).ignoresSafeArea())
        }
    }
}

struct CustomNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            CustomNavBarView(showBackButton: true, showNavBar: true, title: "Title here")
            Spacer()
        }
        
    }
}

extension CustomNavBarView{
    
    private var backButton: some View{
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.left")
                
        })
    }
    
    private var titleSection: some View{
        Text(title)
    }
}
