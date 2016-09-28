//
//  Hills.swift
//  FloppyBird
//
//  Created by Jeremy Novak on 9/26/16.
//  Copyright © 2016 SpriteKit Book. All rights reserved.
//

import SpriteKit

class Hills:SKSpriteNode {
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        let texture = Textures.sharedInstance.textureWith(name: SpriteName.hills)
        self.init(texture: texture, color: SKColor.white, size: texture.size())
        
        setup()
        setupPhysics()
    }
    
    // MARK: - Setup
    private func setup() {
        self.anchorPoint = CGPoint.zero
        
        self.position = CGPoint.zero
        
        // Child sprite that will be added to the right
        let childSprite = Textures.sharedInstance.spriteWith(name: SpriteName.hills)
        childSprite.anchorPoint = CGPoint.zero
        childSprite.position = CGPoint(x: self.size.width, y: 0)
        self.addChild(childSprite)
    }
    
    private func setupPhysics() {
    }
    
    // MARK: - Update
    func update(delta: TimeInterval) {
        let moveAmount = CGFloat(delta) * 60 * 0.25
        
        if self.position.x < 0 - self.size.width / 2 {
            self.position = CGPoint.zero
        } else {
            let newX = self.position.x - moveAmount
            self.position = CGPoint(x: newX, y: self.position.y)
        }
    }
    
    // MARK: - Actions
    private func animate() {
    }
}

