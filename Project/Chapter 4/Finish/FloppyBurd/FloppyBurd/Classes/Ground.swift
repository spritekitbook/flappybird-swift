//
//  Ground.swift
//  FloppyBurd
//
//  Created by Jeremy Novak on 2/22/16.
//  Copyright © 2016 Jeremy Novak. All rights reserved.
//

import SpriteKit

class Ground:SKSpriteNode {
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        let texture = GameTextures.sharedInstance.textureWithName(name: SpriteName.Ground)
        self.init(texture: texture, color: SKColor.whiteColor(), size: texture.size())
        
        self.setupGround()
        self.setupGroundPhysics()
    }
    
    // MARK: - Setup
    private func setupGround() {
        // Set the anchorpoint to 0,0 (bottom left)
        self.anchorPoint = CGPointZero
        
        // Set the position to 0,0 (bottom left of the screen)
        self.position = CGPointZero
        
        // Child sprite that will be added to the right
        let childSprite = GameTextures.sharedInstance.spriteWithName(name: SpriteName.Ground)
        childSprite.anchorPoint = CGPointZero
        childSprite.position = CGPoint(x: self.size.width, y: 0)
        self.addChild(childSprite)
    }
    
    private func setupGroundPhysics() {
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        self.physicsBody?.categoryBitMask = Contact.Scene
        self.physicsBody?.dynamic = false
        self.physicsBody?.collisionBitMask = 0x0
        self.physicsBody?.contactTestBitMask = 0x0
    }
    
    // MARK: - Update
    func update(delta delta: NSTimeInterval) {
        let moveAmount = kDeviceTablet ? CGFloat(delta) * 60 * 4 : CGFloat(delta) * 60 * 2
        
        if self.position.x < 0 - self.size.width / 2 {
            self.position = CGPointZero
        } else {
            let newX = self.position.x - moveAmount
            self.position = CGPoint(x: newX, y: self.position.y)
        }
    }
}