//
//  Logo.swift
//  FloppyBird
//
//  Created by Jeremy Novak on 9/26/16.
//  Copyright © 2016 SpriteKit Book. All rights reserved.
//

import SpriteKit

class Logo:SKSpriteNode {
    
    // MARK: - Private class constants
    private let flap0 = Textures.sharedInstance.textureWith(name: SpriteName.logo0)
    private let flap1 = Textures.sharedInstance.textureWith(name: SpriteName.logo1)
    private let flapTime:TimeInterval = 0.1
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        let texture = Textures.sharedInstance.textureWith(name: SpriteName.logo0)
        self.init(texture: texture, color: SKColor.white, size: texture.size())
        
        setup()
        setupPhysics()
        animate()
    }
    
    // MARK: - Setup
    private func setup() {
        self.position = kScreenCenter
    }
    
    private func setupPhysics() {
    }
    
    // MARK: - Update
    func update(delta: TimeInterval) {
    }
    
    // MARK: - Actions
    private func animate() {
        let frames = [flap0, flap1]
        
        let animation = SKAction.animate(with: frames, timePerFrame: flapTime)
        
        self.run(SKAction.repeatForever(animation))
    }
}
