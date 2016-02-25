//
//  Scoreboard.swift
//  FloppyBurd
//
//  Created by Jeremy Novak on 2/24/16.
//  Copyright © 2016 Jeremy Novak. All rights reserved.
//

import SpriteKit

class Scoreboard:SKSpriteNode {
    
    // MARK: - Private class constants
    private let scoreLabel = GameFonts.sharedInstance.createLabel(string: "0", fontType: GameFonts.FontType.Scoreboard)
    private let bestScoreLabel = GameFonts.sharedInstance.createLabel(string: "0", fontType: GameFonts.FontType.Scoreboard)
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init(score: Int, bestScore: Int) {
        let texture = GameTextures.sharedInstance.textureWithName(name: SpriteName.Scoreboard)
        self.init(texture: texture, color: SKColor.whiteColor(), size: texture.size())
        
        self.setupScoreboard(score: score, bestScore: bestScore)
    }
    
    // MARK: - Setup
    private func setupScoreboard(score score: Int, bestScore: Int) {
        self.position = CGPoint(x: kViewSize.width / 2, y: kViewSize.height * 0.55)
        
        // Position is based on the anchorpoint of the parent.
        self.scoreLabel.position = CGPoint(x: -self.frame.size.width / 4, y: 0)
        self.scoreLabel.text = String(score)
        self.addChild(self.scoreLabel)
        
        self.bestScoreLabel.position = CGPoint(x: self.frame.size.width / 4, y: 0)
        self.bestScoreLabel.text = String(bestScore)
        self.addChild(self.bestScoreLabel)
    }
}
