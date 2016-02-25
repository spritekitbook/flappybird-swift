//
//  GameLogo.swift
//  FloppyBurd
//
//  Created by Jeremy Novak on 2/24/16.
//  Copyright © 2016 Jeremy Novak. All rights reserved.
//

import SpriteKit


class GameLogo:SKSpriteNode {
    
    // MARK: - Private class constants
    private let flap0 = GameTextures.sharedInstance.textureWithName(name: SpriteName.GameLogo0)
    private let flap1 = GameTextures.sharedInstance.textureWithName(name: SpriteName.GameLogo1)
    private let flapTime:NSTimeInterval = 0.1
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        let texture = GameTextures.sharedInstance.textureWithName(name: SpriteName.GameLogo0)
        self.init(texture: texture, color: SKColor.whiteColor(), size: texture.size())
        
        self.setupGameTitleLogo()
        self.setupFlapAnimation()
    }
    
    // MARK: - Setup
    private func setupGameTitleLogo() {
        self.position = kScreenCenter
    }
    
    // MARK: - Animations
    private func setupFlapAnimation() {
        let animationTextureArray = [flap0, flap1]
        
        let animation = SKAction.animateWithTextures(animationTextureArray, timePerFrame: self.flapTime)
        
        self.runAction(SKAction.repeatActionForever(animation))
    }
}
