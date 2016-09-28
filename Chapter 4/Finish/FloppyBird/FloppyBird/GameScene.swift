//
//  GameScene.swift
//  FloppyBird
//
//  Created by Jeremy Novak on 9/24/16.
//  Copyright © 2016 SpriteKit Book. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    // MARK: - Private class constants
    private let cloudController = CloudController()
    private let hills = Hills()
    private let ground = Ground()
    private let tutorial = Tutorial()
    private let floppy = Floppy()
    
    // MARK: - Private class variables
    private var lastUpdateTime:TimeInterval = 0.0
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    override func didMove(to view: SKView) {
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        self.backgroundColor = Colors.colorFrom(rgb: Colors.sky)
        
        self.addChild(cloudController)
        self.addChild(hills)
        self.addChild(ground)
        self.addChild(tutorial)
        self.addChild(floppy)
        
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -10)
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.categoryBitMask = Contact.scene
        self.physicsBody?.collisionBitMask = 0x0
        self.physicsBody?.contactTestBitMask = 0x0
    }
    
    // MARK: - Update
    override func update(_ currentTime: TimeInterval) {
        let delta = currentTime - lastUpdateTime
        lastUpdateTime = currentTime
        
        cloudController.update(delta: delta)
        floppy.update()
    }
    
    // MARK: - Touch Events
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first! as UITouch
        let touchLocation = touch.location(in: self)
        
//        if tutorial.contains(touchLocation) {
//            loadScene()
//        }
        
        floppy.fly()
    }
    
    // MARK: - Load Scene
    private func loadScene() {
        let scene = GameOverScene(size: kViewSize)
        let transition = SKTransition.fade(with: SKColor.black, duration: 0.5)
        
        self.view?.presentScene(scene, transition: transition)
    }
}
