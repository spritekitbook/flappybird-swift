//
//  TutorialButton.swift
//  FloppyBurd
//
//  Created by Jeremy Novak on 2/22/16.
//  Copyright © 2016 Jeremy Novak. All rights reserved.
//

import SpriteKit

class TutorialButton:SKSpriteNode {
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        let texture = GameTextures.sharedInstance.textureWithName(name: SpriteName.ButtonTutorial)
        self.init(texture: texture, color: SKColor.whiteColor(), size: texture.size())
        
        self.setupPlayButton()
    }
    
    // MARK: - Setup
    private func setupPlayButton() {
        self.position = kScreenCenter
    }
    
    // MARK: - Actions
    func tapped() {
        self.runAction(SKAction.waitForDuration(0.25), completion: {
            self.removeFromParent()
        })
    }
}
