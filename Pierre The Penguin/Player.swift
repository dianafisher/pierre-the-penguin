//
//  Player.swift
//  Pierre The Penguin
//
//  Created by Diana Fisher on 11/6/18.
//  Copyright © 2018 Diana Fisher. All rights reserved.
//

import SpriteKit

class Player: SKSpriteNode {
    var initalSize = CGSize(width: 64, height: 64)
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "Pierre")
    
    var flyAnimation = SKAction()
    var soarAnimation = SKAction()
    
    init() {
        super.init(texture: nil, color: .clear, size: initalSize)
        createAnimations()
        self.run(flyAnimation, withKey: "flapAnimation")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createAnimations() {
        let rotateUpAction = SKAction.rotate(toAngle: 0, duration: 0.475)
        rotateUpAction.timingMode = .easeOut
        
        let rotateDownAction = SKAction.rotate(toAngle: -1, duration: 0.8)
        rotateDownAction.timingMode = .easeIn
        
        // Create the flying animation
        let flyFrames: [SKTexture] = [textureAtlas.textureNamed("pierre-flying-1"),
                                      textureAtlas.textureNamed("pierre-flying-2"),
                                      textureAtlas.textureNamed("pierre-flying-3"),
                                      textureAtlas.textureNamed("pierre-flying-4"),
                                      textureAtlas.textureNamed("pierre-flying-3"),
                                      textureAtlas.textureNamed("pierre-flying-2"),
                                      ]
        
        let flyAction = SKAction.animate(with: flyFrames, timePerFrame: 0.03)
        
        // Create the flying animation
        flyAnimation = SKAction.group([SKAction.repeatForever(flyAction), rotateUpAction])
        
        // Create the soaring animation
        let soarFrames: [SKTexture] = [textureAtlas.textureNamed("pierre-flying-1")]
        let soarAction = SKAction.animate(with: soarFrames, timePerFrame: 1)
        
        // Group the soaring animation with the rotation down
        soarAnimation = SKAction.group([SKAction.repeatForever(soarAction), rotateDownAction])
    }
    
    func onTap() {
        // do nothing
    }
    
}
