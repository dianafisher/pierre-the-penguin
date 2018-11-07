//
//  Bee.swift
//  Pierre The Penguin
//
//  Created by Diana Fisher on 11/6/18.
//  Copyright © 2018 Diana Fisher. All rights reserved.
//

import SpriteKit

class Bee: SKSpriteNode, GameSprite {

    var initialSize: CGSize = CGSize(width: 28, height: 24)
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "Enemies")
    var flyAnimation = SKAction()
    
    init() {
        super.init(texture: nil, color: .clear, size: initialSize)
        createAnimations()
        self.run(flyAnimation)
        
        // Attach a physics body, shaped like a circle
        self.physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createAnimations() {
        let flyFrames: [SKTexture] = [textureAtlas.textureNamed("bee"),
                                      textureAtlas.textureNamed("bee-fly")]
        
        let flyAction = SKAction.animate(with: flyFrames, timePerFrame: 0.14)
        
        flyAnimation = SKAction.repeatForever(flyAction)
    }
    
    func onTap() {
        // Not implemented
    }
}
