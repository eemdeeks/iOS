//
//  GameScene.swift
//  uleng
//
//  Created by 박승찬 on 2023/08/18.
//

import Foundation
import SpriteKit

class GameScene: SKScene{
    
    override func didMove(to view: SKView) {
        self.physicsWorld.gravity = CGVector(dx: -5.0, dy: 0.0)
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let square = SKSpriteNode()
            
            square.size = CGSize(width: 50, height: 50)
            square.position = touch.location(in: self)
            square.color = .blue
            
            square.physicsBody = SKPhysicsBody(rectangleOf: square.size)
            //square.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(1))
            
            square.physicsBody?.isDynamic = true
            square.physicsBody?.affectedByGravity = true
            
            addChild(square)
            
        }
    }
}
