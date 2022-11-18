//
//  ContentView.swift
//  restaurant
//
//  Created by Russyk Destroyer on 15.11.2022.
//

import SwiftUI

struct ContentView: View {
    func isAuthenticated() -> Bool{
        let defaults = UserDefaults.standard
        guard let _ = defaults.string(forKey: "jsonwebtoken") else {
            return false
        }
        return true
    }
    
    @AppStorage("currentPage") var currentPage = 1
                
    var body: some View {
        
        if currentPage > totalPages {
            if self.isAuthenticated() {
                Home()
            }
            else {
                Home()
            }
        }
        else {
            OnboardingScreen()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//Onboarding
var totalPages = 3

struct OnboardingScreen: View {
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        ZStack {
            
            if currentPage == 1 {
                ScreenView(title: "Mexican food")
            }
            if currentPage == 2 {
                ScreenView(title: "Mexican food")
            }
            if currentPage == 3 {
                ScreenView(title: "Mexican food")
            }
            
        }
    }
}

struct ScreenView: View {
    
    @AppStorage("currentPage") var currentPage = 3
    
    var title: String
    
    var body: some View {
        
        VStack {
            
            
            Spacer(minLength: 0)
            
            VStack {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .kerning(1.2)
                    .padding(.top, 5)
                    .foregroundColor(.white)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 50)
                    .frame(maxWidth: 150)
                
                
                
                HStack (){
                    
                    if currentPage == 1 {
                        Color(.white).frame(height: 8 / UIScreen.main.scale)
                        Color(.gray).frame(height: 8 / UIScreen.main.scale)
                        Color(.gray).frame(height: 8 / UIScreen.main.scale)
                    }
                    
                    else if currentPage == 2 {
                        Color(.gray).frame(height: 8 / UIScreen.main.scale)
                        Color(.white).frame(height: 8 / UIScreen.main.scale)
                        Color(.gray).frame(height: 8 / UIScreen.main.scale)
                    }
                    
                    else if currentPage == 3 {
                        Color(.gray).frame(height: 8 / UIScreen.main.scale)
                        Color(.gray).frame(height: 8 / UIScreen.main.scale)
                        Color(.white).frame(height: 8 / UIScreen.main.scale)
                    }
                    
                } .padding(.horizontal, 35) .padding(.bottom)
                
                Button(action: {
                    if currentPage <= totalPages {
                        currentPage += 1
                    }
                    else {
                        currentPage = 1
                    }
                }, label: {
                    
                    if currentPage == 3 {
                        Text("Get started")
                            .fontWeight(.semibold)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.black)
                            .background(.white)
                            .cornerRadius(50)
                            .padding(.horizontal, 100)
                    }
                    
                    else {
                        Text("Next")
                            .fontWeight(.semibold)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(.black)
                            .cornerRadius(50)
                            .padding(.horizontal, 100)
                    }
                })
                .padding(.bottom, 100)
            }
            .padding(.bottom, 25)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("sliderBack")).ignoresSafeArea()
        
    }
    
}



//Menu
//struct Menu: View {
//    var body: some View {
//
//            ScrollView(showsIndicators: false) {
//
//                VStack {
//
//                    HStack {
//
//                        Image("logo")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(height: 100)
//                            .padding(.trailing, 16)
//
//                        Text("Jalapenos Restaurant")
//                            .font(.largeTitle)
//                            .fontWeight(.semibold)
//                            .padding(.top, 10)
//                            .kerning(0.3)
//                    }
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(.white)
//                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
//                    .padding(.bottom, 10)
//
//                    VStack {
//                        Text("Nachos")
//                            .fontWeight(.medium)
//                            .frame(maxWidth: .infinity)
//                            .padding(.top, 10)
//                            .padding(.bottom, 5)
//                            .font(.title)
//
//                        Text("Crispy corn tortillas topped with refried beans, mustard cheese, lettuce, guacamole & jalapenos")
//                            .font(.footnote)
//                            .multilineTextAlignment(.center)
//                            .padding(.leading, 20)
//                            .padding(.trailing, 20)
//                            .padding(.bottom, 5)
//                        Text("asd")
//
//                    }
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .border(.black, width: 1)
//
//
//                }
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .padding()
//
//    }
//}
