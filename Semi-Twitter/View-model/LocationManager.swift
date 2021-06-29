//
//  LocationManager.swift
//  Rhythms
//
//  Created by Aria Zare on 3/6/21.
//

import SwiftUI
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    static let locationManager = LocationManager()
    
    let manager = CLLocationManager()
    var lastlocation = CLLocation()
    
    var dictionary: [String: Any] {
        let coordinates: [String: Any] = ["longitude": lastlocation.coordinate.longitude,
                                          "latitude": lastlocation.coordinate.latitude]
        return [
            "coordinates": coordinates
        ]
    }
    
    override init() {
        super.init()
        configure()
    }
    
    private func configure() {
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        startMySignificantLocationChanges()
    }
    
    private func startMySignificantLocationChanges() {
        if !CLLocationManager.significantLocationChangeMonitoringAvailable() {
            // The device does not support this service.
            return
        }
        manager.startMonitoringSignificantLocationChanges()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastlocation = locations.last {
            self.lastlocation = lastlocation
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
       if let error = error as? CLError, error.code == .denied {
          // Location updates are not authorized.
          manager.stopMonitoringSignificantLocationChanges()
          return
       }
       // Notify the user of any errors.
    }
    
}

