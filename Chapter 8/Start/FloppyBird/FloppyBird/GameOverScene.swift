//
//  GameOverScene.swift
//  FloppyBird
//
//  Created by Jeremy Novak on 9/24/16.
//  Copyright © 2016 SpriteKit Book. All rights reserved.
//

import SpriteKit

class GameOverScene: SKScene {
    
    // MARK: - Private class constants
    private let cloudController = CloudController()
    private let hills = Hills()
    private let ground = Ground()
    private let retryButton = RetryButton()
    
    // MARK: - Private class variables
    private var lastUpdateTime:TimeInterval = 0.0
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    convenience init(size: CGSize, score: Int) {
        self.init(size: size)
        
        setup(score: score)
    }
    
    override func didMove(to view: SKView) {
    }
    
    // MARK: - Setup
    private func setup(score: Int) {
        self.backgroundColor = Colors.colorFrom(rgb: Colors.sky)
        
        self.addChild(cloudController)
        self.addChild(hills)
        self.addChild(ground)
        self.addChild(retryButton)
        
        let scoreBoard = Scoreboard(score: score)
        self.addChild(scoreBoard)
    }
    
    // MARK: - Update
    override func update(_ currentTime: TimeInterval) {
        let delta = currentTime - lastUpdateTime
        lastUpdateTime = currentTime
        
        cloudController.update(delta: delta)
    }
    
    // MARK: - Touch Events
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first! as UITouch
        let touchLocation = touch.location(in: self)
        
        if retryButton.contains(touchLocation) {
            loadScene()
        }
    }
    
    // MARK: - Load Scene
    private func loadScene() {
        let scene = GameScene(size: kViewSize)
        let transition = SKTransition.fade(with: SKColor.black, duration: 0.5)
        
        self.view?.presentScene(scene, transition: transition)
    }
}

