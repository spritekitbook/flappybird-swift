//
//  ScoreLabel.swift
//  FloppyBurd
//
//  Created by Jeremy Novak on 2/24/16.
//  Copyright © 2016 Jeremy Novak. All rights reserved.
//

import SpriteKit

class ScoreLabel:SKNode {
    
    // MARK: - Private class constants
    private let label = GameFonts.sharedInstance.createLabel(string: "0", fontType: GameFonts.FontType.ScoreLabel)
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        super.init()
        
        self.setupScoreLabel()
    }
    
    // MARK: - Setup
    private func setupScoreLabel() {
        self.label.position = kScreenCenter
        
        self.addChild(self.label)
    }
    
    // MARK: - Update Score
    func updateScore(score score: Int) {
        self.label.text = String(score)
    }
}