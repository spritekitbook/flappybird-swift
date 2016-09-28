//
//  Scoreboard.swift
//  FloppyBird
//
//  Created by Jeremy Novak on 9/27/16.
//  Copyright © 2016 SpriteKit Book. All rights reserved.
//

import SpriteKit

class Scoreboard:SKSpriteNode {
    
    // MARK: - Private class constants
    private let scoreLabel = SKLabelNode(fontNamed: kFont)
    private let bestLabel = SKLabelNode(fontNamed: kFont)
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init(score: Int) {
        let texture = Textures.sharedInstance.textureWith(name: SpriteName.scoreboard)
        self.init(texture: texture, color: SKColor.white, size: texture.size())
        
        setup(score: score)
    }
    
    // MARK: - Setup
    private func setup(score: Int) {
        
        let bestScore = Settings.sharedInstance.getBestScore()
        
        self.position = CGPoint(x: kViewSize.width / 2, y: kViewSize.height * 0.55)
        
        // Position the labels based on the anchorPoint for the parent.
        scoreLabel.position = CGPoint(x: -self.frame.size.width / 4, y: -self.frame.size.height * 0.2)
        scoreLabel.fontColor = Colors.colorFrom(rgb: Colors.scoreboard)
        scoreLabel.fontSize = 60.0
        scoreLabel.text = String(score)
        self.addChild(scoreLabel)
        
        bestLabel.position = CGPoint(x: self.frame.size.width / 4, y: -self.frame.size.height * 0.2)
        bestLabel.fontColor = Colors.colorFrom(rgb: Colors.scoreboard)
        bestLabel.fontSize = 60.0
        bestLabel.text = String(bestScore)
        self.addChild(bestLabel)
    }
    
    private func setupPhysics() {
    }
    
    // MARK: - Update
    func update(delta: TimeInterval) {
    }
    
    // MARK: - Actions
    private func animate() {
    }
}

