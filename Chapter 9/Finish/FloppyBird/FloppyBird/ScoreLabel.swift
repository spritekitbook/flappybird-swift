//
//  ScoreLabel.swift
//  FloppyBird
//
//  Created by Jeremy Novak on 9/27/16.
//  Copyright © 2016 SpriteKit Book. All rights reserved.
//

import SpriteKit

class ScoreLabel:SKNode {
    
    // MARK: - Private class constants
    private let label = SKLabelNode(fontNamed: kFont)
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        super.init()
        
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        self.position = kScreenCenter
        
        label.text = String(0)
        label.fontColor = Colors.colorFrom(rgb: Colors.score)
        label.fontSize = 200.0
        label.alpha = 0.5
        
        self.addChild(label)
    }
    
    // MARK: - Update
    func updateScore(score: Int) {
        label.text = String(score)
    }
}
