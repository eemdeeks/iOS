//
//  GameScene.swift
//  uleng
//
//  Created by 박승찬 on 2023/08/18.
//

import Foundation
import SpriteKit

class Water: SKSpriteNode { }

class GameScene: SKScene, ObservableObject{
    @Published var gravityX: Double = 0
    @Published var gravityY: Double = 0
    
    
    override func update(_ currentTime: TimeInterval) {
        self.physicsWorld.gravity = CGVector(dx: self.gravityX * 10, dy: self.gravityY * 10)
        print("중력 : \(gravityX)")
    }
    override func didMove(to view: SKView) {
//        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: -1.0)
        self.size = CGSize(width: 300, height: 400)
        self.scaleMode = .fill
        self.backgroundColor = .white
//        let water = SKSpriteNode(imageNamed: "water")
//        water.size = CGSize(width: 10, height: 10)
//        water.color = .blue
//
//        for i in stride(from: 0, to: view.bounds.width - water.frame.width, by: water.frame.width) {
//            for j in stride(from: 100, to: view.bounds.height - water.frame.height, by: water.frame.height) {
//                let water = SKSpriteNode(imageNamed: "water")
//                water.size = CGSize(width: 10, height: 10)
//                water.position = CGPoint(x: i, y: j)
//                water.color = .blue
//
//    //            square.physicsBody = SKPhysicsBody(rectangleOf: square.size)
//                water.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(1))
//
//                water.physicsBody?.isDynamic = true
//                water.physicsBody?.affectedByGravity = true
//
//                addChild(water)
//            }
//        }
//
        let square = SKSpriteNode(imageNamed: "water")
        let squareRadius = square.frame.width / 2.0

//        for i in 0...100 {
//            for j in 0...10 {
//                let square = Water(imageNamed: "water")
//                square.size = CGSize(width: 100, height: 100)
//
//                square.color = .blue
//
//        //            square.physicsBody = SKPhysicsBody(rectangleOf: square.size)
//                square.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(1))
//
//                square.physicsBody?.isDynamic = true
//                square.physicsBody?.affectedByGravity = true
//                square.position = CGPoint(x: i*10, y: j)
//                addChild(square)
//            }
//        }
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            //let square = SKSpriteNode()
            let square = SKSpriteNode(imageNamed: "water")
            let squareRadius = square.frame.width / 2.0
            square.size = CGSize(width: 100, height: 100)
            square.position = touch.location(in: self)
            square.color = .blue
            
//            square.physicsBody = SKPhysicsBody(rectangleOf: square.size)
            square.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(1))
            
            square.physicsBody?.isDynamic = true
            square.physicsBody?.affectedByGravity = true
            
            addChild(square)
            
        }
    }
}
