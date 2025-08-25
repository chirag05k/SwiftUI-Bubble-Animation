//
//  BubbleAnimation.swift
//  HIKE-SwiftUI
//
//  Created by Chirag V on 25/08/25.
//

import SwiftUI

struct MotionAnimationView: View {
    
    // MARK: - Properties
    @State private var randomCircle = Int.random(in: 20...30)
    @State private var isAnimating = false
    
    // MARK: - Functions
    
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 40...120))
    }
    
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.5...2.0))
    }
    
    func randomSpeed() -> Double {
        return Double.random(in: 0.05...1.0)
    }
    
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.indigo.ignoresSafeArea()
                
                ForEach(0...randomCircle, id: \.self) { _ in
                    Circle()
                        .foregroundStyle(.white)
                        .opacity(0.25)
                        .frame(width: randomSize())
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height)
                        )
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .onAppear {
                            withAnimation(
                                .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                                    .repeatForever()
                                    .speed(randomSpeed())
                                    .delay(randomDelay())
                            ) {
                                isAnimating = true
                            }
                        }
                }
            }
            .drawingGroup()
        }
        .ignoresSafeArea()
    }
}

struct MotionAnimationView_Preview: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
