//
//  Ground.swift
//  Pierre The Penguin
//
//  Created by Diana Fisher on 11/6/18.
//  Copyright © 2018 Diana Fisher. All rights reserved.
//

import SpriteKit

class Ground: SKSpriteNode, GameSprite {
    
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "Environment")
    var initialSize: CGSize = CGSize.zero
    
    func createChildren() {
        // Position the ground by its top left corner
        self.anchorPoint = CGPoint(x: 0, y: 1)
        
        let texture = textureAtlas.textureNamed("ground")
        
        var tileCount: CGFloat = 0
        let tileSize = CGSize(width: 35, height: 300)
        
        // Build nodes until we cover the entire ground width
        
        while tileCount * tileSize.width < self.size.width {
            let tileNode = SKSpriteNode(texture: texture)
            tileNode.size = tileSize
            tileNode.position.x = tileCount * tileSize.width
            tileNode.anchorPoint = CGPoint(x: 0, y: 1) // top left corner
            
            self.addChild(tileNode)
            
            tileCount += 1
        }
    }
    
    func onTap() {
        // do nothing
    }
}
