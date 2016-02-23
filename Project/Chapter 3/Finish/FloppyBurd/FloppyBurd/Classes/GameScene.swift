//
//  GameScene.swift
//  floppyburd
//
//  Created by Jeremy Novak on 2/20/16.
//  Copyright (c) 2016 Jeremy Novak. All rights reserved.
//

import SpriteKit

class GameScene:SKScene, SKPhysicsContactDelegate {
    
    // MARK: - Private class constants
    private let tutorialButton = TutorialButton()
    private let gameNode = SKNode()
    private let ground = Ground()
    private let player = Player()
    
    // MARK: - Private class variables
    private var lastUpdateTime:NSTimeInterval = 0.0
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    override func didMoveToView(view: SKView) {
        self.setupScene()
    }
    
    // MARK: - Setup
    private func setupScene() {
        // Set the background color
        self.backgroundColor = Colors.colorFromRGB(rgbvalue: Colors.Background)
        
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVectorMake(0, 0)
        
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        self.physicsBody?.dynamic = false
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.categoryBitMask = Contact.Scene
        self.physicsBody?.collisionBitMask = 0x0
        self.physicsBody?.contactTestBitMask = 0x0
        
        // Add the play button
        //self.addChild(self.tutorialButton)
        
        // Add the game node to the scene
        self.addChild(self.gameNode)
        
        // Add the ground to the game node
        self.gameNode.addChild(self.ground)
        
        // Add the tutorial button to the game node
        self.gameNode.addChild(self.tutorialButton)
        
        // Add the player to the game node
        self.gameNode.addChild(self.player)
    }
    
    // MARK: - Update
    override func update(currentTime: NSTimeInterval) {
        // Calculate "delta"
        let delta = currentTime - self.lastUpdateTime
        self.lastUpdateTime = currentTime
        
        self.ground.update(delta: delta)
        
        self.player.update()
    }
    
    // MARK: - Touch Events
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch:UITouch = touches.first! as UITouch
        let touchLocation = touch.locationInNode(self)
        
        if self.tutorialButton.containsPoint(touchLocation) {
            self.tutorialButton.tapped()
            
            //self.loadGameOverScene()
            self.enableGravity()
        }
    
        self.player.fly()
    }
    
    // MARK: - Temporary function
    private func enableGravity() {
        self.physicsWorld.gravity = CGVectorMake(0, -10)
        
        self.tutorialButton.runAction(SKAction.waitForDuration(0.25), completion: {
            self.tutorialButton.removeFromParent()
        })
    }
    
    // MARK: - Load Scene
    private func loadGameOverScene() {
        let gameOverScene = GameOverScene(size: kViewSize)
        let transition = SKTransition.fadeWithColor(SKColor.blackColor(), duration: 0.25)
        
        self.view?.presentScene(gameOverScene, transition: transition)
    }
}
