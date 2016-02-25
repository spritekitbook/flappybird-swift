//
//  GameOver.swift
//  FloppyBurd
//
//  Created by Jeremy Novak on 2/24/16.
//  Copyright © 2016 Jeremy Novak. All rights reserved.
//

import SpriteKit

class GameOver:SKSpriteNode {
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        let texture = GameTextures.sharedInstance.textureWithName(name: SpriteName.GameOver)
        self.init(texture: texture, color: SKColor.whiteColor(), size: texture.size())
        
        self.setupGameOver()
    }
    
    // MARK: - Setup
    private func setupGameOver() {
        self.position = CGPoint(x: kViewSize.width / 2, y: kViewSize.height * 0.8)
    }
}
