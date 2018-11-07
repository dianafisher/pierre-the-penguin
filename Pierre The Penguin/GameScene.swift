//
//  GameScene.swift
//  Pierre The Penguin
//
//  Created by Diana Fisher on 11/6/18.
//  Copyright © 2018 Diana Fisher. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let cameraNode = SKCameraNode()
    let player = Player()
    let ground = Ground()
    
    override func didMove(to view: SKView) {
        
        self.anchorPoint = .zero
        
        // Set the scene background to a nice sky blue
        self.backgroundColor = UIColor(red: 0.4, green: 0.6, blue: 0.95, alpha: 1.0)
        
        // Assign the camera to the scene
        self.camera = cameraNode
        
        // Spawn test bees
        let bee2 = Bee()
        bee2.position = CGPoint(x: 325, y: 325)
        self.addChild(bee2)
        
        let bee3 = Bee()
        bee3.position = CGPoint(x: 200, y: 325)
        self.addChild(bee3)
        
        // Position the ground based on the screen size
        ground.position = CGPoint(x: -self.size.width * 2, y: 150)
        ground.size = CGSize(width: self.size.width * 6, height: 0)
        ground.createChildren()
        
        self.addChild(ground)
        
        // Add the player to the scene
        player.position = CGPoint(x: 150, y: 250)
        self.addChild(player)
    }
    
    override func didSimulatePhysics() {
        // Keep the camera centered on the bee
        guard let camera = self.camera else { return }
        camera.position = player.position
    }
    
    func addBackground() {
        let bg = SKSpriteNode(imageNamed: "background-menu")
        bg.position = CGPoint(x: 250, y: 250)
        self.addChild(bg)
    }       
}
