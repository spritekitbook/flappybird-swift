//
//  GameScene.swift
//  floppyburd
//
//  Created by Jeremy Novak on 2/20/16.
//  Copyright (c) 2016 Jeremy Novak. All rights reserved.
//

import SpriteKit

class GameScene:SKScene {
    
    // MARK: - Private class constants
    private let tutorialButton = TutorialButton()
    
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
        
        // Add the play button
        self.addChild(self.tutorialButton)
    }
    
    // MARK: - Update
    override func update(currentTime: NSTimeInterval) {
    }
    
    // MARK: - Touch Events
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch:UITouch = touches.first! as UITouch
        let touchLocation = touch.locationInNode(self)
        
        if self.tutorialButton.containsPoint(touchLocation) {
            self.tutorialButton.tapped()
            
            self.loadGameOverScene()
        }
    }
    
    // MARK: - Load Scene
    private func loadGameOverScene() {
        let gameOverScene = GameOverScene(size: kViewSize)
        let transition = SKTransition.fadeWithColor(SKColor.blackColor(), duration: 0.25)
        
        self.view?.presentScene(gameOverScene, transition: transition)
    }
}
