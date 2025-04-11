//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Aakash Gupta on 06/04/25.
//

import SwiftUI

struct MotionAnimationView: View {
    // MARK: - PROPERTIES
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false
    
    // MARK: - FUNCTIONS
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    func randomSize() -> CGFloat {
        return CGFloat.random(in: 0...300)
    }
    
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 1...2))
    }
    
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1)
    }
    
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    // MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<randomCircle, id: \.self) { _ in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ?  randomScale() : 1)
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height)
                        )
                        .animation(
                            Animation.interpolatingSpring(
                                stiffness: 0.5,
                                damping: 0.5
                            )
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        )
                        .onAppear(perform: {
                            isAnimating = true
                        })
                }
            }//: ZStack
            .drawingGroup()
        }//: GeometryReader
    }
}

// MARK: - PREVIEW
#Preview {
    MotionAnimationView()
}
