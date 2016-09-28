//
//  Smoke.swift
//  FloppyBird
//
//  Created by Jeremy Novak on 9/28/16.
//  Copyright © 2016 SpriteKit Book. All rights reserved.
//

import SpriteKit

class Smoke:SKSpriteNode {
    
    // MARK: - Private class variables
    private var animation = SKAction()
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        let texture = Textures.sharedInstance.textureWith(name: SpriteName.smoke0)
        self.init(texture: texture, color: SKColor.white, size: texture.size())
        
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        let frame0 = Textures.sharedInstance.textureWith(name: SpriteName.smoke0)
        let frame1 = Textures.sharedInstance.textureWith(name: SpriteName.smoke1)
        let frame2 = Textures.sharedInstance.textureWith(name: SpriteName.smoke2)
        let frame3 = Textures.sharedInstance.textureWith(name: SpriteName.smoke3)
        let frame4 = Textures.sharedInstance.textureWith(name: SpriteName.smoke4)
        
        animation = SKAction.animate(with: [frame0, frame1, frame2, frame3, frame4], timePerFrame: 0.1)
        
        self.alpha = 0.0
    }
    
    // MARK: - Actions
    func animate() {
        self.alpha = 1.0
        
        self.run(self.animation, completion:  {
            [weak self] in
            self?.removeFromParent()
        })
    }
}

