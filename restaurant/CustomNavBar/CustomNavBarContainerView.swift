//
//  CustomNavBarContainerView.swift
//  restaurant
//
//  Created by Aldiyar Akhmediyev on 17.11.2022.
//

import SwiftUI

struct CustomNavBarContainerView<Content: View>: View {
    
    let content: Content
    @State private var showNavBar: Bool = true
    @State private var showBackButton: Bool = true
    @State private var title: String = ""
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0){
            CustomNavBarView(showBackButton: showBackButton, showNavBar: showNavBar, title: title)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onPreferenceChange(CustomNavBarTitlePreferenceKey.self,
                            perform: { value in
            self.title = value
        })
        .onPreferenceChange(CustomNavBarBackButtonHiddenPreferenceKey.self, perform: { value in
            self.showBackButton = !value
        })
        .onPreferenceChange(CustomNavBarHiddenPreferenceKey.self, perform: { value in
            self.showNavBar = !value
        })
    }
}

struct CustomNavBarContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBarContainerView{
            ZStack {
                Color.green.ignoresSafeArea()
                
                
                Text("Hello, world")
                    .customNavigationTitle("New Title")
                    .customNavigationBarBackButtonHidden(false)
                    .customNavigationBarHidden(false)
            }
        }
    }
}
