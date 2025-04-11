//
//  LocationModel.swift
//  Africa
//
//  Created by Aakash Gupta on 06/04/25.
//

import SwiftUI
import MapKit

struct NationParkLocation: Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: latitude, longitude: longitude
        )
    }
}
