//
//  AddressLocation.swift
//  Spine
//
//  Created by Aashita Tyagi on 12/03/21.
//

import Foundation
import Combine
import CoreLocation


class AddressLocation: NSObject, ObservableObject, CLLocationManagerDelegate {
  private let geocoder = CLGeocoder()
  
  // Rest of the class
    
    private let locationManager = CLLocationManager()
     let objectWillChange = PassthroughSubject<Void, Never>()

     @Published var status: CLAuthorizationStatus? {
       willSet { objectWillChange.send() }
     }

     @Published var location: CLLocation? {
       willSet { objectWillChange.send() }
     }

     override init() {
       super.init()

       self.locationManager.delegate = self
       self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
       self.locationManager.requestWhenInUseAuthorization()
       self.locationManager.startUpdatingLocation()
     }

    
    @Published var placemark: CLPlacemark? {
       willSet { objectWillChange.send() }
     }
    
    private func geocode() {
       guard let location = self.location else { return }
       geocoder.reverseGeocodeLocation(location, completionHandler: { (places, error) in
         if error == nil {
           self.placemark = places?[0]
         } else {
           self.placemark = nil
         }
       })
     }

}

extension CLLocation {
    var latitude: Double {
        return self.coordinate.latitude
    }
    
    var longitude: Double {
        return self.coordinate.longitude
    }
}
