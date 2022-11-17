//
//  AppNavBarView.swift
//  restaurant
//
//  Created by Aldiyar Akhmediyev on 17.11.2022.
//

import SwiftUI

struct AppNavBarView: View {
    var body: some View {
        CustomNavView{
            ZStack{
                Color.orange.ignoresSafeArea()
                
                CustomNavLink(destination:
                    Text("Destination")
                    .customNavigationTitle("Second Screen")
                ){
                    Text("Navigate")
                }
            }
            .customNavigationBarHidden(true)
        }
        
    }
}

struct AppNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppNavBarView()
    }
}


extension AppNavBarView{
    
    private var defaultNavView: some View {
        NavigationView{
            ZStack{
                Color.green.ignoresSafeArea()
                
                NavigationLink(
                    destination:
                        Text("Destination")
                        .navigationTitle("Title 2")
                        .navigationBarBackButtonHidden(false)
                    ,
                    label: {
                        Text("Navigate")
                    }
                )
            }
            .navigationTitle("Nav title here")
        }
    }
}
