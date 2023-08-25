//
//  WaveView.swift
//  uleng
//
//  Created by 박승찬 on 2023/08/24.
//

import SwiftUI
import CoreMotion
import SpriteKit

let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

struct WaveView: View {
    @ObservedObject var viewModel = GameScene()
    
    var motionManager = CMMotionManager()

    @State private var gravityY : Double = 0
    @State private var gravityZ : Double = 0
    @State private var Position : String = "Move Me"
    
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: 300, height: 400)
//        scene.physicsWorld.gravity = CGVector(dx: gravityX, dy: 0.0)
        
        scene.scaleMode = .fill
        scene.backgroundColor = .white
        return scene
    }

    var body : some View {
        VStack{
            SpriteView(scene: viewModel)
//                .task(id: gravityX) {
//                    scene.physicsWorld.gravity = CGVector(dx: gravityX, dy: 0.0)
//                    print("중력 : \(scene.physicsWorld.gravity)")
//                }
            Text("Gravity XYZ")
            Text("\(viewModel.gravityX)")
            Text("\(gravityY)")
            Text("\(gravityZ)")

            Text(Position)
        }
        .onReceive(timer) { input in
            print(motionManager.isDeviceMotionAvailable)
            if motionManager.isDeviceMotionAvailable {
                motionManager.deviceMotionUpdateInterval = 0.3
                
                motionManager.startDeviceMotionUpdates(to: OperationQueue.main) { data,error in
                    print("Gravity XYZ")
                    viewModel.gravityX = data?.gravity.x ?? 0
                    viewModel.gravityY = data?.gravity.y ?? 0
                    gravityZ = data?.gravity.z ?? 0
//                    if gravityX < -0.9
//                    {
//                        Position = "Standing + Landscape + Speaker Left"
//                    }
//                    else if gravityX > 0.9
//                    {
//                        Position = "Standing + Landscape + Speaker Right"
//                    }
//                    else if gravityY < -0.9
//                    {
//                        Position = "Standing + Portrait + Speaker Up"
//                    }
//                    else if gravityY > 0.9
//                    {
//                        Position = "Standing + Portrait + Speaker Down"
//                    }
//                    else if gravityZ < -0.9
//                    {
//                        Position = "Flat + Facing Up"
//                    }
//                    else if gravityZ > 0.9
//                    {
//                        Position = "Flat + Facing Down"
//                    }
//                    else
//                    {
//                        Position = "Not at right angles"
//                    }

                    print(data?.gravity.x ?? 0)
                    print(data?.gravity.y ?? 0)
                    print(data?.gravity.z ?? 0)
                    print("User Acceleration")
                    print(data?.userAcceleration.x ?? 0)
                    print(data?.userAcceleration.y ?? 0)
                    print(data?.userAcceleration.z ?? 0)
                    print("Heading")
                    print(data?.heading.debugDescription ?? 0)
                    print(data?.heading.magnitude ?? 0)
                    print(data?.heading.sign ?? 0)
                    print("Attitude")
                    print(data?.attitude.debugDescription ?? 0)
                    print(data?.attitude.pitch ?? 0)
                    print(data?.attitude.roll ?? 0)
                    print(data?.attitude.yaw ?? 0)
                    print("Magnetic Field")
                    print(data?.magneticField.field.x ?? 0)
                    print(data?.magneticField.field.y ?? 0)
                    print(data?.magneticField.field.z ?? 0)
                }
            }
        }
    }
}
struct WaveView_Previews: PreviewProvider {
    static var previews: some View {
        WaveView()
    }
}
