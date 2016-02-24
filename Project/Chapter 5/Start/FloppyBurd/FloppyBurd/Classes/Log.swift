//
//  Log.swift
//  FloppyBurd
//
//  Created by Jeremy Novak on 2/23/16.
//  Copyright © 2016 Jeremy Novak. All rights reserved.
//

import SpriteKit

class Log:SKSpriteNode {
    
    // MARK: - Public enum
    enum LogType:Int {
        case Bottom
        case Top
    }
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init(logType: LogType) {
        var texture = SKTexture()
        
        switch logType {
        case LogType.Bottom:
            texture = GameTextures.sharedInstance.textureWithName(name: SpriteName.BottomLog)
            
        case LogType.Top:
            texture = GameTextures.sharedInstance.textureWithName(name: SpriteName.TopLog)
            
        }
        
        self.init(texture: texture, color: SKColor.whiteColor(), size: texture.size())
        
        self.setupLogPhysics(logType: logType)
    }
    
    
    // MARK: - Setup
    private func setupLog() {
    }
    
    private func setupLogPhysics(logType logType: LogType) {
        
        switch logType {
        case LogType.Bottom:
            self.physicsBody = SKPhysicsBody(texture: self.texture!, size: self.size)
            
        case LogType.Top:
            self.physicsBody = SKPhysicsBody(texture: self.texture!, size: self.size)
        }
        
        self.physicsBody?.dynamic = false
        self.physicsBody?.categoryBitMask = Contact.Log
        self.physicsBody?.collisionBitMask = 0x0
        self.physicsBody?.contactTestBitMask = 0x0
    }
    
    // MARK: - Update
    func update(delta delta: NSTimeInterval) {
        let moveAmount = kDeviceTablet ? CGFloat(delta) * 60 * 4 : CGFloat(delta) * 60 * 2
        
        self.position.x = self.position.x - moveAmount
        
        if self.position.x < (0 - self.size.width) {
            self.removeFromParent()
        }
        
    }
}
