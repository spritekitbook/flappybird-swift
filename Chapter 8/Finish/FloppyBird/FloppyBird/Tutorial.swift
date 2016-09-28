//
//  Tutorial.swift
//  FloppyBird
//
//  Created by Jeremy Novak on 9/26/16.
//  Copyright © 2016 SpriteKit Book. All rights reserved.
//

import SpriteKit

class Tutorial:SKSpriteNode {
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        let texture = Textures.sharedInstance.textureWith(name: SpriteName.tutorial)
        self.init(texture: texture, color: SKColor.white, size: texture.size())
        
        setup()
        setupPhysics()
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
    }
    
    // MARK: - Tapped
    func tapepd() {
        let scaleUp = SKAction.scale(to: 1.1, duration: 0.25)
        let scaleDown = SKAction.scale(to: 0.0, duration: 0.5)
        let completion = SKAction.removeFromParent()
        
        let sequence = SKAction.sequence([scaleUp, scaleDown, completion])
        
        self.run(sequence)
        
        self.run(Sound.sharedInstance.playSound(sound: .pop))
    }
}

