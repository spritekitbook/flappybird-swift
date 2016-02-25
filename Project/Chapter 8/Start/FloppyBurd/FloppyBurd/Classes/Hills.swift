//
//  Hills.swift
//  FloppyBurd
//
//  Created by Jeremy Novak on 2/25/16.
//  Copyright © 2016 Jeremy Novak. All rights reserved.
//

import SpriteKit

class Hills:SKSpriteNode {
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        let texture = GameTextures.sharedInstance.textureWithName(name: SpriteName.Hills)
        self.init(texture: texture, color: SKColor.whiteColor(), size: texture.size())
        
        self.setupHills()
    }
    
    // MARK: - Setup
    private func setupHills() {
        self.anchorPoint = CGPointZero
        self.position = CGPointZero
        
        // Child sprite that will be added to the right
        let childSprite = GameTextures.sharedInstance.spriteWithName(name: SpriteName.Hills)
        childSprite.anchorPoint = CGPointZero
        childSprite.position = CGPoint(x: self.size.width, y: 0)
        self.addChild(childSprite)
    }
    
    // MARK: - Update
    func update(delta delta: NSTimeInterval) {
        let moveAmount = kDeviceTablet ? CGFloat(delta) * 60 * 0.5 : CGFloat(delta) * 60 * 0.25
        
        if self.position.x < 0 - self.size.width / 2 {
            self.position = CGPointZero
        } else {
            let newX = self.position.x - moveAmount
            self.position = CGPoint(x: newX, y: self.position.y)
        }
    }
}
