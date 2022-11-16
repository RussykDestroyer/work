//
//  HomeViewModel.swift
//  restaurant
//
//  Created by Aldiyar Akhmediyev on 16.11.2022.
//

import SwiftUI
import CoreLocation


class HomeViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    
    @Published var locationManager = CLLocationManager()
    @Published var search = ""
    
    // Location Details....
    @Published var userLocation: CLLocation!
    @Published var userAddress = ""
    @Published var noLocation = false
    
    // Sidebar...
    @Published var showMenu = false
    
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager){
        
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:
            print("authorized")
            self.noLocation = false
            manager.requestLocation()
        case .denied:
            print("denied")
            self.noLocation = true
        default:
            print("unknown")
            self.noLocation = false
            locationManager.requestWhenInUseAuthorization()
            // Modiying Info.plist...
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        
        print(error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // reading User Location and Extracting Details....
        
        self.userLocation = locations.last
        self.extractLocation()
    }
    
    func extractLocation(){
        
        CLGeocoder().reverseGeocodeLocation(self.userLocation) {(res, err) in
            
            guard let safeData = res else{return}
            
            var address = ""
            
            // getting area and locality name ...
            
            address += safeData.first?.name ?? ""
            address += ", "
            address += safeData.first?.locality ?? ""
            
            self.userAddress = address
        }
    }
}
