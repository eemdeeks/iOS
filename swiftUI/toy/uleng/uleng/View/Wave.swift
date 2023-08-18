//
//  Wave.swift
//  uleng
//
//  Created by 박승찬 on 2023/08/16.
//

import SwiftUI
import SpriteKit

struct Wave: View {
    
    @State var progress: CGFloat = 0.5
    @State var startAnimation: CGFloat = 0
    
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: 300, height: 400)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        VStack{
            GeometryReader { proxy in
                
                let size = proxy.size
                
                ZStack{
                    WaterWave(progress: 0.5, waveHeight: 0.05, offset: startAnimation)
                        .fill(Color(.systemBlue))
                        .overlay(content: {
                            ZStack {
                                Circle()
                                    .fill(.white.opacity(0.1))
                                    .frame(width: 30, height: 30)
                                    .offset(x: 40, y: 40)
                                Circle()
                                    .fill(.white.opacity(0.1))
                                    .frame(width: 15, height: 15)
                                    .offset(x: 80, y: 80)
                                Circle()
                                    .fill(.white.opacity(0.1))
                                    .frame(width: 15, height: 15)
                                    .offset(x: 0, y: 100)
                                Circle()
                                    .fill(.white.opacity(0.1))
                                    .frame(width: 15, height: 15)
                                    .offset(x: 100, y: 100)
                                Circle()
                                    .fill(.white.opacity(0.1))
                                    .frame(width: 20, height: 20)
                                    .offset(x: 100, y: 200)
                                Circle()
                                    .fill(.white.opacity(0.1))
                                    .frame(width: 20, height: 20)
                                    .offset(x: -10, y: 70)
                            }
                        })
                }
                .frame(width: size.width, height: size.height, alignment: .center)
                .onAppear{
                    withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)){
                        startAnimation = size.width
                    }
                }
                
                SpriteView(scene: scene)
                    .frame(width: 300,height: 400)
                    
                    
            }
        }.padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        
    }
}

struct WaterWave: Shape{
    
    var progress: CGFloat
    // Wave Height
    var waveHeight: CGFloat
    // Intial Animation Start
    var offset: CGFloat
    
    var animatableData: CGFloat {
        get{offset}
        set{offset = newValue}
    }
    func path(in rect: CGRect) -> Path {
        return Path{ path in
            path.move(to: .zero)
            
            // MARK: - Drawing Waves using Sine
            let progressHeight: CGFloat = (1 - progress) * rect.height
            let height = waveHeight * rect.height
            
            for value in stride(from: 0, to: rect.width, by: 2){
                let x: CGFloat = value
                let sine: CGFloat = sin(Angle(degrees: value + offset).radians)
                let y: CGFloat = progressHeight + (height * sine)
                
                path.addLine(to: CGPoint(x: x, y: y))
            }
            
            //Bottom Portion
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
        }
    }
}

struct Wave_Previews: PreviewProvider {
    static var previews: some View {
        Wave()
    }
}
