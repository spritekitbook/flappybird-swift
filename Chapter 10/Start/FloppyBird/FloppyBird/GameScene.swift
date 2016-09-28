//
//  GameScene.swift
//  FloppyBird
//
//  Created by Jeremy Novak on 9/24/16.
//  Copyright © 2016 SpriteKit Book. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    // MARK: - Private enum
    private enum State {
        case tutorial, running, paused, gameOver
    }
    
    // MARK: - Private class constants
    private let cloudController = CloudController()
    private let hills = Hills()
    private let ground = Ground()
    private let tutorial = Tutorial()
    private let floppy = Floppy()
    private let logController = LogController()
    private let scoreLabel = ScoreLabel()
    private let gameNode = SKNode()
    
    // MARK: - Private class variables
    private var lastUpdateTime:TimeInterval = 0.0
    private var state:State = .tutorial
    private var previousState:State = .tutorial
    
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
        
        self.addChild(gameNode)
        
        gameNode.addChild(scoreLabel)
        gameNode.addChild(cloudController)
        gameNode.addChild(hills)
        gameNode.addChild(logController)
        gameNode.addChild(ground)
        gameNode.addChild(tutorial)
        gameNode.addChild(floppy)
        
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVector.zero
        
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
        
        if state != .running {
            return
        } else {
            floppy.update()
            logController.update(delta: delta)
            ground.update(delta: delta)
            hills.update(delta: delta)
        }
    }
    
    // MARK: - Touch Events
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first! as UITouch
        let touchLocation = touch.location(in: self)
        
        if state == .tutorial {
            if tutorial.contains(touchLocation) {
                tutorial.tapepd()
                running()
            }
        } else if state == .running {
            floppy.fly()
        }
    }
    
    // MARK: - Contact
    func didBegin(_ contact: SKPhysicsContact) {
        if state != .running {
            return
        } else {
            // Which body is not Floppy?
            let other = contact.bodyA.categoryBitMask == Contact.floppy ? contact.bodyB : contact.bodyA
            
            if other.categoryBitMask == Contact.scene {
                // Player hit the ground or the ceiling
                floppy.crashed()
                shake()
                flash()
                gameOver()
            }
            
            if other.categoryBitMask == Contact.log {
                // Player hit a log
                floppy.smacked()
                shake()
                flash()
                gameOver()
            }
            
            if other.categoryBitMask == Contact.score {
                floppy.updateScore()
                scoreLabel.updateScore(score: floppy.getScore())
            }
            
        }
    }
    
    // MARK: - State
    private func running() {
        state = .running
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -10)
    }
    
    func paused() {
        previousState = state
        state = .paused
    }
    
    func resume() {
        state = .running
    }
    
    func gameOver() {
        state = .gameOver
        
        floppy.gameOver()
        
        self.run(SKAction.wait(forDuration: 2.0), completion: {
            [weak self] in
            self?.loadScene()
        })
    }
    
    // MARK: - Scene Animations
    private func shake() {
        gameNode.run(SKAction.shake(amount: CGPoint(x: 16, y: 16), duration: 0.5))
    }
    
    private func flash() {
        let colorFlash = SKAction.run {
            [weak self] in
            self?.backgroundColor = Colors.colorFrom(rgb: Colors.flash)
            
            self?.run(SKAction.wait(forDuration: 0.5), completion: {
                [weak self] in
                self?.backgroundColor = Colors.colorFrom(rgb: Colors.sky)
            })
        }
        
        self.run(colorFlash)
    }
    
    // MARK: - Load Scene
    private func loadScene() {
        let scene = GameOverScene(size: kViewSize, score: floppy.getScore())
        let transition = SKTransition.fade(with: SKColor.black, duration: 0.5)
        
        self.view?.presentScene(scene, transition: transition)
    }
}
