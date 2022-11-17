//
//  ContentView.swift
//  restaurant
//
//  Created by Russyk Destroyer on 15.11.2022.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("currentPage") var currentPage = 1
                
    var body: some View {
        
        if currentPage > totalPages {
            Home()
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
                ScreenView(image: "slide1", title: "Tasty food", description: "")
            }
            if currentPage == 2 {
                ScreenView(image: "slide2", title: "Tasty food", description: "")
            }
            if currentPage == 3 {
                ScreenView(image: "slide3", title: "Tasty food", description: "")
            }
            
        }
    }
}

struct ScreenView: View {
    
    @AppStorage("currentPage") var currentPage = 1
    
    var image: String
    var title: String
    var description: String
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                if currentPage == 1 {
                    Text("Welcome!")
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.4)
                }
                else {
                    Button(action: {
                        currentPage -= 1
                    }, label: {
                        Image(systemName: "chevron.left")
                            .padding(.vertical, 5)
                            .padding(.horizontal, 8)
                            .background(.black)
                            .foregroundColor(.white)
                            .cornerRadius(100)
                    })
                }
                
                Spacer()
                
                Button(action: {
                    currentPage = 4
                }, label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .kerning(1.3)
                })
            } .padding() .foregroundColor(.black)
            
            Spacer(minLength: 0)
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 16)
                .frame(height: 300)
            
            Spacer(minLength: 80)
            
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .kerning(1.2)
                .padding(.top, 5)
                .padding(.bottom, 5)
                .foregroundColor(.black)
            
            Text("Experience a taste of wold-class chiefsasdassadasdasdasdasdasd")
                .font(.body)
                .fontWeight(.regular)
                .kerning(1.2)
                .padding(.leading, 16)
                .padding(.trailing, 16)
                .multilineTextAlignment(.center)
            
            Spacer(minLength: 0)
            
            HStack {
                
                if currentPage == 1 {
                    Color(.black).frame(height: 8 / UIScreen.main.scale)
                    Color(.gray).frame(height: 8 / UIScreen.main.scale)
                    Color(.gray).frame(height: 8 / UIScreen.main.scale)
                }
                
                else if currentPage == 2 {
                    Color(.gray).frame(height: 8 / UIScreen.main.scale)
                    Color(.black).frame(height: 8 / UIScreen.main.scale)
                    Color(.gray).frame(height: 8 / UIScreen.main.scale)
                }
                
                else if currentPage == 3 {
                    Color(.gray).frame(height: 8 / UIScreen.main.scale)
                    Color(.gray).frame(height: 8 / UIScreen.main.scale)
                    Color(.black).frame(height: 8 / UIScreen.main.scale)
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
                        .foregroundColor(.white)
                        .background(.black)
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
        }
    }
}

//Home
//struct Home: View {
//    var body: some View {
//        TabView {
//            Menu()
//                .tabItem() {
//                    Image(systemName: "book")
//                    Text("Menu")
//                }
//            Cart()
//                .tabItem() {
//                    Image(systemName: "basket")
//                    Text("Basket")
//                }
//            MyProfile()
//                .tabItem() {
//                    Image(systemName: "person")
//                    Text("My Profile")
//                }
//        }
//        .accentColor(.black)
//    }
//}

//Menu
struct Menu: View {
    var body: some View {
        
            ScrollView(showsIndicators: false) {
                
                VStack {
                    
                    HStack {
                        
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 100)
                            .padding(.trailing, 16)
                        
                        Text("Jalapenos Restaurant")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .padding(.top, 10)
                            .kerning(0.3)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.white)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 10)
                    
                    VStack {
                        Text("Nachos")
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity)
                            .padding(.top, 10)
                            .padding(.bottom, 5)
                            .font(.title)
                        
                        Text("Crispy corn tortillas topped with refried beans, mustard cheese, lettuce, guacamole & jalapenos")
                            .font(.footnote)
                            .multilineTextAlignment(.center)
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                            .padding(.bottom, 5)
                        Text("asd")

                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .border(.black, width: 1)
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()

    }
}

////Cart
//struct Cart: View {
//    var body: some View {
//        Text("fff")
//    }
//}

//MyProfile
struct MyProfile: View {
    var body: some View {
        Text("asd")
    }
}
