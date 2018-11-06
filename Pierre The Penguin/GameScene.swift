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
        let mySprite = SKSpriteNode(color: .blue, size: CGSize(width: 50, height: 50))
        
        // Set position of sprite relative to its parent node
        mySprite.position = CGPoint(x: 150, y: 150)
        
        // Add it to the node tree
        self.addChild(mySprite)
        
        // Scale 4X initial scale
        let scaleAction = SKAction.scale(to: 4, duration: 5)
        
        // Rotate 5 radians
        let rotateAction = SKAction.rotate(byAngle: 5, duration: 5)
        
        // Group the actions
//        let actionGroup = SKAction.group([scaleAction, rotateAction])
        
        // Run actions in sequence
        let actionSequence = SKAction.sequence([scaleAction, rotateAction])
        
        // Tell our sprite to execute the action
        mySprite.run(actionSequence)
    }
}
