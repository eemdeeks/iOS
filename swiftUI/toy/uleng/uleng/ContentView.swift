//
//  ContentView.swift
//  uleng
//
//  Created by 박승찬 on 2023/08/15.
//

import SwiftUI

struct WavyShape: Shape {
    var amplitude: CGFloat = 100
    var frequency: CGFloat = 1
    var phase: CGFloat = 0
    var animationDuration: Double = 2
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        let midHeight = height / 2
        
        path.move(to: CGPoint(x: 0, y: midHeight))
        
        for x in stride(from: 0, to: width, by: 5) {
            let relativeX = x / width
            let y = sin((relativeX + phase) * frequency * 2 * .pi) * amplitude + midHeight
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        return path
    }
}

struct Snowflake: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let centerX = rect.midX
        let centerY = rect.midY
        let radius = min(rect.width, rect.height) / 2
        
        path.move(to: CGPoint(x: centerX, y: centerY - radius))
        path.addLine(to: CGPoint(x: centerX, y: centerY + radius))
        path.move(to: CGPoint(x: centerX - radius, y: centerY))
        path.addLine(to: CGPoint(x: centerX + radius, y: centerY))
        path.move(to: CGPoint(x: centerX - radius / 2, y: centerY - radius / 2))
        path.addLine(to: CGPoint(x: centerX + radius / 2, y: centerY + radius / 2))
        path.move(to: CGPoint(x: centerX + radius / 2, y: centerY - radius / 2))
        path.addLine(to: CGPoint(x: centerX - radius / 2, y: centerY + radius / 2))
        
        return path
    }
}


struct ContentView: View {
    @State private var animationPhase: CGFloat = 0
    var body: some View {
        Wave()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
