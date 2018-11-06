//
//  GameScene.swift
//  Pierre The Penguin
//
//  Created by Diana Fisher on 11/6/18.
//  Copyright © 2018 Diana Fisher. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        
        self.anchorPoint = .zero
        
        // Set the scene background to a nice sky blue
        self.backgroundColor = UIColor(red: 0.4, green: 0.6, blue: 0.95, alpha: 1.0)
        
        // Create our bee sprite
        let bee = SKSpriteNode()
        bee.size = CGSize(width: 28, height: 24)
        bee.position = CGPoint(x: 250, y: 250)
        self.addChild(bee)
        
        // Find our bee texture atlas
        let beeAtlas = SKTextureAtlas(named: "Enemies")
        let beeFrames:[SKTexture] = [beeAtlas.textureNamed("bee"), beeAtlas.textureNamed("bee-fly")]
        
        // Create actions to make our bee fly. 🐝
        let flyAction = SKAction.animate(with: beeFrames, timePerFrame: 0.14)
        let beeAction = SKAction.repeatForever(flyAction)
        
        bee.run(beeAction)
        
        // Create actions to make our bee fly back and forth
        let pathLeft = SKAction.moveBy(x: -200, y: -10, duration: 2)
        let pathRight = SKAction.moveBy(x: 200, y: 10, duration: 2)
        
        // Actions to flip the bee back and forth
        let flipNegative = SKAction.scaleX(to: -1, duration: 0)
        let flipPositive = SKAction.scaleX(to: 1, duration: 0)
        
        let flightOfBee = SKAction.sequence([pathLeft, flipNegative, pathRight, flipPositive])
        
        let neverEndingFlight = SKAction.repeatForever(flightOfBee)
        
        bee.run(neverEndingFlight)
    }
}
