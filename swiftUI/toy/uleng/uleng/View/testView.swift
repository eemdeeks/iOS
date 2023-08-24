//
//  testView.swift
//  uleng
//
//  Created by 박승찬 on 2023/08/24.
//

import SwiftUI
import SpriteKit

struct testView: View {
    
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: 300, height: 400)
        scene.scaleMode = .fill
        scene.backgroundColor = .white
        return scene
    }
    
    var body: some View {
        GeometryReader{ geo in
            SpriteView(scene: scene)
                .frame(width: geo.size.width,height: geo.size.height)
        }
            
    }
}

struct testView_Previews: PreviewProvider {
    static var previews: some View {
        testView()
    }
}
