//
//  GameOverScene.swift
//  FloppyBurd
//
//  Created by Jeremy Novak on 2/22/16.
//  Copyright © 2016 Jeremy Novak. All rights reserved.
//

import SpriteKit

class GameOverScene:SKScene {
    
    // MARK: - Private class constants
    private let retryButton = RetryButton()
    private let cloudController = CloudController()
    private let hills = Hills()
    private let ground = Ground()
    private let gameOver = GameOver()
    
    // MARK: - Private class variables
    private var scoreboard = Scoreboard()
    private var lastUpdateTime:NSTimeInterval = 0.0
    
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    convenience init(size: CGSize, score: Int) {
        self.init(size: size)
        
        self.setupScene(score: score)
    }
    
    // MARK: - Setup
    private func setupScene(score score: Int) {
        // Set the background color
        self.backgroundColor = Colors.colorFromRGB(rgbvalue: Colors.Background)
        
        // Add the cloud controller to the scene
        self.addChild(self.cloudController)
        
        // Add the hills to the scene
        self.addChild(self.hills)
        
        // Add the ground to the scene
        self.addChild(self.ground)
        
        // Add the game over title to the scene
        self.addChild(self.gameOver)
        
        // Instantiate the scoreboard, then add it to the scene
        self.scoreboard = Scoreboard(score: score, bestScore: GameSettings.sharedInstance.getBestScore())
        self.addChild(self.scoreboard)
        
        // Add the play button
        self.addChild(self.retryButton)
    }
    
    // MARK: - Update
    override func update(currentTime: NSTimeInterval) {
        
        // Calculate "delta"
        let delta = currentTime - self.lastUpdateTime
        self.lastUpdateTime = currentTime
        
        self.cloudController.update(delta: delta)
    }
    
    // MARK: - Touch Events
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch:UITouch = touches.first! as UITouch
        let touchLocation = touch.locationInNode(self)
        
        if self.retryButton.containsPoint(touchLocation) {
            self.retryButton.tapped()
            
            //self.loadMenuScene()
            self.loadGameScene()
        }
    }
    
    // MARK: - Load Scene
//    private func loadMenuScene() {
//        let menuScene = MenuScene(size: kViewSize)
//        let transition = SKTransition.fadeWithColor(SKColor.blackColor(), duration: 0.25)
//        
//        self.view?.presentScene(menuScene, transition: transition)
//    }
    
    private func loadGameScene() {
        let gameScene = GameScene(size: kViewSize)
        let transition = SKTransition.fadeWithColor(SKColor.blackColor(), duration: 0.25)
        
        self.view?.presentScene(gameScene, transition: transition)
    }
}