//
//  CustomNavBarPreferenceKeys.swift
//  restaurant
//
//  Created by Aldiyar Akhmediyev on 17.11.2022.
//

import Foundation
import SwiftUI

//@State private var showBackButton: Bool = true
//@State private var title: String = "Title" //""

struct CustomNavBarTitlePreferenceKey: PreferenceKey{
    
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

struct CustomNavBarBackButtonHiddenPreferenceKey: PreferenceKey{
    
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

struct CustomNavBarHiddenPreferenceKey: PreferenceKey{
    
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

extension View{
    
    func customNavigationTitle(_ title: String) -> some View{
        preference(key: CustomNavBarTitlePreferenceKey.self, value: title)
    }
    
    func customNavigationBarBackButtonHidden(_ hidden: Bool) -> some View{
        preference(key: CustomNavBarBackButtonHiddenPreferenceKey.self, value: hidden)
    }
    
    func customNavigationBarHidden(_ hidden_bar: Bool) -> some View{
        preference(key: CustomNavBarHiddenPreferenceKey.self, value: hidden_bar)
    }
    
    func customNavBarItems(title: String = "", backButtonHidden: Bool = false, navBarHidden: Bool = false) -> some View{
        self
            .customNavigationTitle(title)
            .customNavigationBarBackButtonHidden(backButtonHidden)
            .customNavigationBarHidden(navBarHidden)
    }
}
