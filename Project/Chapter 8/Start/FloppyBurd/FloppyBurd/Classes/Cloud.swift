//
//  Cloud.swift
//  FloppyBurd
//
//  Created by Jeremy Novak on 2/25/16.
//  Copyright © 2016 Jeremy Novak. All rights reserved.
//

import SpriteKit

class Cloud:SKSpriteNode {
    
    // MARK: - Private class properties
    private var moveSpeed:CGFloat = 0.0
    
    // MARK: - Public enum
    internal enum CloudType:Int {
        case Large
        case Medium
        case Small
    }
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init(cloudType: CloudType) {
        let texture = GameTextures.sharedInstance.textureWithName(name: SpriteName.Cloud)
        
        self.init(texture: texture, color: SKColor.whiteColor(), size: texture.size())
        
        self.setupCloud(cloudType)
    }
    
    // MARK: - Setup
    private func setupCloud(cloudType: CloudType) {
        switch cloudType {
            case CloudType.Large:
                return
                
            case CloudType.Medium:
                self.setScale(0.75)
                
            case CloudType.Small:
                self.setScale(1.0)
        }
    }
    
    // MARK: - Update
    func update(delta delta: NSTimeInterval) {
        let speedX = kDeviceTablet ? CGFloat(delta) * self.moveSpeed * 4 : CGFloat(delta) * self.moveSpeed * 2
        
        self.position.x = self.position.x - speedX
        
        // Remove the cloud if completely offscreen left
        if self.position.x < (0 - self.size.width) {
            self.removeFromParent()
        }
    }
    
    // MARK: - Variable Movement Speed
    func setMovementSpeed(speed speed: CGFloat) {
        self.moveSpeed = speed
    }
}
