//
//  Textures.swift
//  FloppyBird
//
//  Created by Jeremy Novak on 9/26/16.
//  Copyright © 2016 SpriteKit Book. All rights reserved.
//

import SpriteKit

class Textures {
    
    static let sharedInstance = Textures()
    
    // MARK: - Private class constants
    private let atlasName = "Sprites"
    
    // MARK: - Private class variables
    private var sprites = SKTextureAtlas()
    
    // MARK: - Init
    init() {
        self.sprites = SKTextureAtlas(named: atlasName)
    }
    
    // MARK: - Public convenience functions
    func textureWith(name: String) -> SKTexture {
        return sprites.textureNamed(name)
    }
    
    func spriteWith(name: String) -> SKSpriteNode {
        let texture = sprites.textureNamed(name)
        return SKSpriteNode(texture: texture)
    }
}
