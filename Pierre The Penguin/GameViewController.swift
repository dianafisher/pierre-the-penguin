//
//  GameViewController.swift
//  Pierre The Penguin
//
//  Created by Diana Fisher on 11/6/18.
//  Copyright © 2018 Diana Fisher. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewWillLayoutSubviews() {
        
        super.viewWillLayoutSubviews()
        
        if let view = self.view as! SKView? {
            // Load the scene
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to fit the window
                scene.scaleMode = .aspectFill
                scene.size = view.bounds.size
                
                view.presentScene(scene)
            }
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
