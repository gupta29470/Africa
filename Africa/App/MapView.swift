//
//  MapView.swift
//  Africa
//
//  Created by Aakash Gupta on 05/04/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: - PROPERTIES
    @State private var region: MKCoordinateRegion = {
        var mapCoordinate = CLLocationCoordinate2D(
            latitude: 6.600286, longitude: 16.4377599
        )
        
        var mapZoomLevel = MKCoordinateSpan(
            latitudeDelta: 70.0, longitudeDelta: 70.0
        )
        
        var mapRegion = MKCoordinateRegion(
            center: mapCoordinate, span: mapZoomLevel
        )
        
        return mapRegion
    }()
    
    let locations: [NationParkLocation] = Bundle.main.decode("locations.json")
    
    // MARK: - BODY
    var body: some View {
        // Basic Map
//        Map(coordinateRegion: $region)
        
        // Advance Map
        Map(
            coordinateRegion: $region,
            annotationItems: locations,
            annotationContent: { annotation in
                // MapPin: Old Style - always static
//                MapPin(
//                    coordinate: annotation.location,
//                    tint: .accentColor
//                )
                
                // MapMarker - New style
//                MapMarker(
//                    coordinate: annotation.location, tint: .accentColor
//                )
                
                // Custom Annotation
//                MapAnnotation(coordinate: annotation.location) {
//                    Image("logo")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 32, height: 32, alignment: .center)
//                }
                
                MapAnnotation(coordinate: annotation.location) {
                    MapAnnotationView(location: annotation)
                }
            }
        )//: Map
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Longitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    
                }
            }
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
                )
                .padding()
            , alignment: .top
        )
    }
}

// MARK: - PREVIEW
#Preview {
    MapView()
}
