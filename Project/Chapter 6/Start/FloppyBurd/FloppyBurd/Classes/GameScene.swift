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
    private let scoreLabel = ScoreLabel()
    private let tutorialButton = TutorialButton()
    private let gameNode = SKNode()
    private let ground = Ground()
    private let player = Player()
    private let logController = LogController()
    
    // MARK: - Private class variables
    private var lastUpdateTime:NSTimeInterval = 0.0
    private var state = GameState.Tutorial
    
    // MARK: - Private class enum
    private enum GameState:Int {
        case Tutorial
        case Running
        case Paused
        case GameOver
    }
    
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
        
        // Add the score label to the game node
        self.gameNode.addChild(self.scoreLabel)
        
        // Add the logController to the game node
        self.gameNode.addChild(self.logController)
        
        // Add the ground to the game node
        self.gameNode.addChild(self.ground)
        
        // Add the tutorial button to the game node
        self.gameNode.addChild(self.tutorialButton)
        
        // Add the player to the game node
        self.gameNode.addChild(self.player)
        
        // Add the logController to the game node
        //self.gameNode.addChild(self.logController)
    }
    
    // MARK: - Update
    override func update(currentTime: NSTimeInterval) {
        // Calculate "delta"
        let delta = currentTime - self.lastUpdateTime
        self.lastUpdateTime = currentTime
        
        switch self.state {
            case GameState.Tutorial:
                return
                
            case GameState.Running:
                self.logController.update(delta: delta)
                self.ground.update(delta: delta)
                self.player.update()
                
            case GameState.Paused:
                return
                
            case GameState.GameOver:
                return
        }
    }
    
    // MARK: - Touch Events
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        switch self.state {
        case GameState.Tutorial:
            self.switchToRunning()
            
        case GameState.Running:
            self.player.fly()
            
        case GameState.Paused:
            return
            
        case GameState.GameOver:
            return
        }
    }
    
    // MARK: - Contact
    func didBeginContact(contact: SKPhysicsContact) {
        if self.state != GameState.Running {
            return
        } else {
            // Which body is not the player?
            let other = contact.bodyA.categoryBitMask == Contact.Player ? contact.bodyB : contact.bodyA
            
            // Did the player crash into the scene?
            if other.categoryBitMask == Contact.Scene {
                if kDebug {
                    print("Game Over: Player crashed into the scene.")
                } else {
                    self.switchToGameOver()
                }
            }
            
            // Did the player crash into a log? 
            if other.categoryBitMask == Contact.Log {
                if kDebug {
                    print("Game Over: Player crashed into a log.")
                } else {
                    self.switchToGameOver()
                }
            }
            
            // Did the player pass through a score node?
            if other.categoryBitMask == Contact.Score {
                if kDebug {
                    print("Score +1")
                } else {
                    self.player.updateScore()
                    self.scoreLabel.updateScore(score: self.player.getScore())
                }
            }
        }
    }
    
    
    // MARK: - State functions
    private func switchToRunning() {
        self.state = GameState.Running
        
        // Remove the tutorial button
        self.tutorialButton.tapped()
        
        // Enable gravity
        self.physicsWorld.gravity = kDeviceTablet ? CGVectorMake(0, -20) : CGVectorMake(0, -10)
    }
    
    private func switchToPaused() {
        self.state = GameState.Paused
    }
    
    private func switchToResume() {
        self.state = GameState.Running
    }
    
    private func switchToGameOver() {
        self.state = GameState.GameOver
        
        // Run the player's gameOver() function
        self.player.gameOver()
        
        // Load the GameOverScene after a 1.5 second delay
        self.runAction(SKAction.waitForDuration(1.5), completion: {
            self.loadGameOverScene()
        })
    }
    
    // MARK: - Load Scene
    private func loadGameOverScene() {
        let gameOverScene = GameOverScene(size: kViewSize)
        let transition = SKTransition.fadeWithColor(SKColor.blackColor(), duration: 0.25)
        
        self.view?.presentScene(gameOverScene, transition: transition)
    }
}
