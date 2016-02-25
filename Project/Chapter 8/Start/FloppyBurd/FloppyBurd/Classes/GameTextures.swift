//
//  GameTextures.swift
//  FloppyBurd
//
//  Created by Jeremy Novak on 2/22/16.
//  Copyright © 2016 Jeremy Novak. All rights reserved.
//

import SpriteKit

let GameTexturesSharedInstance = GameTextures()

class GameTextures {
    
    class var sharedInstance:GameTextures {
        return GameTexturesSharedInstance
    }
    
    // MARK: - Private class variables
    private var interfaceSpritesAtlas = SKTextureAtlas()
    private var gameSpritesAtlas = SKTextureAtlas()
    
    // MARK: - Init
    init() {
        self.interfaceSpritesAtlas = SKTextureAtlas(named: "Interface Sprites")
        self.gameSpritesAtlas = SKTextureAtlas(named: "Game Sprites")
    }
    
    // MARK: - Public convenience functions
    func textureWithName(name name: String) -> SKTexture {
        return SKTexture(imageNamed: name)
    }
    
    func spriteWithName(name name: String) -> SKSpriteNode {
        return SKSpriteNode(imageNamed: name)
    }
}
