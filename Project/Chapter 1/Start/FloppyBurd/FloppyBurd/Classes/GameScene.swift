//
//  GameScene.swift
//  floppyburd
//
//  Created by Jeremy Novak on 2/20/16.
//  Copyright (c) 2016 Jeremy Novak. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
        
        self.addChild(myLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.location(in: self)
            
            print("Touched at \(location)")
        }
    }
   
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
    }
}
