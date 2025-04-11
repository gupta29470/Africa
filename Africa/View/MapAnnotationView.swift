//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Aakash Gupta on 06/04/25.
//

import SwiftUI

struct MapAnnotationView: View {
    // MARK: - PROPERTIES
    let location: NationParkLocation
    
    @State private var animation: Double = 0
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                .clipShape(.circle)
        }
        .onAppear {
            withAnimation(
                Animation.easeOut(duration: 2).repeatForever(autoreverses: false)
            ) {
                animation = 1
            }
        }
    }
}

// MARK: - PREVIEW
#Preview {
    let locations: [NationParkLocation] = Bundle.main.decode("locations.json")
    
    MapAnnotationView(
        location: locations[1]
    )
        .previewLayout(.sizeThatFits)
        .padding()
}
