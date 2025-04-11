//
//  GalleryView.swift
//  Africa
//
//  Created by Aakash Gupta on 05/04/25.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - PROPERTIES
    
    // Simple grid definition
//    let gridLayout: [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
    
    // Efficient grid definition
//    let gridLayout: [GridItem] = Array(
//        repeating: GridItem(.flexible()),
//        count: 3
//    )
    
    // Dynamic grid layout
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var selectedAnimal: String = "lion"
    
    func gridSwitch() {
        gridLayout = Array(
            repeating: .init(.flexible()),
            count: Int(gridColumn)
        )
    }
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(.circle)
                    .overlay(
                        Circle()
                            .stroke(.white, lineWidth: 8)
                    )
                
                Slider(
                    value: $gridColumn,
                    in: 2...4,
                    step: 1
                )
                .padding(.horizontal)
                .onChange(
                    of: gridColumn,
                    perform: { _ in
                        gridSwitch()
                    }
                )
                
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(.circle)
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 1)
                            )
                            .onTapGesture {
                                selectedAnimal = animal.image
                                haptics.impactOccurred()
                            }
                    }
                } //: Grid
                .animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                })
            }//: VStack
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }//: ScrollView
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

// MARK: - PREVIEW
#Preview {
    GalleryView()
}
