//
//  Log.swift
//  FloppyBird
//
//  Created by Jeremy Novak on 9/27/16.
//  Copyright © 2016 SpriteKit Book. All rights reserved.
//

import SpriteKit

class Log:SKSpriteNode {
    
    enum LogType {
        case top, bottom
    }
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init(type: LogType) {
        var texture = SKTexture()
        
        switch type {
        case .top:
            texture = Textures.sharedInstance.textureWith(name: SpriteName.topLog)
            
        case .bottom:
            texture = Textures.sharedInstance.textureWith(name: SpriteName.bottomLog)
        }
        
        self.init(texture: texture, color: SKColor.white, size: texture.size())
        
        setup()
        setupPhysics()
        
    }
    
    // MARK: - Setup
    private func setup() {
    }
    
    private func setupPhysics() {
        self.physicsBody = SKPhysicsBody(texture: self.texture!, size: self.size)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.categoryBitMask = Contact.log
        self.physicsBody?.collisionBitMask = 0x0
        self.physicsBody?.contactTestBitMask = 0x0
    }

    // MARK: - Update
    func update(delta: TimeInterval) {
        let moveAmount = CGFloat(delta) * 60 * 2
        
        self.position.x = self.position.x - moveAmount
        
        if self.position.x < (0 - self.size.width) {
            self.removeFromParent()
        }
    }
    
    // MARK: - Actions
    private func animate() {
    }
}

