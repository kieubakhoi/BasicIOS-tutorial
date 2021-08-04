//
//  MyPin.swift
//  BasicIOS-tutorial-MapView
//
//  Created by Apple on 05/08/2021.
//

import Foundation
import MapKit

class MyPin: NSObject, MKAnnotation {
    let title: String?
    let locationName : String
    let coordinate: CLLocationCoordinate2D
     init(title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}
