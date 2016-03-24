//
//  Player.swift
//  FloppyBurd
//
//  Created by Jeremy Novak on 2/23/16.
//  Copyright © 2016 Jeremy Novak. All rights reserved.
//

import SpriteKit

class Player:SKSpriteNode {
    
    // MARK: - Private class constants
    private let animationName = "Flap"
    
    // MARK: - Private class variables
    private var score:Int = 0
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        let texture = GameTextures.sharedInstance.textureWithName(name: SpriteName.Player0)
        self.init(texture: texture, color: SKColor.whiteColor(), size: texture.size())
        
        self.setupPlayer()
        self.setupPlayerPhysics()
        self.setupPlayerAnimation()
    }
    
    // MARK: - Setup
    private func setupPlayer() {
        self.position = CGPoint(x: kViewSize.width * 0.3, y: kViewSize.height * 0.8)
    }
    
    private func setupPlayerPhysics() {
        // Make the physics body circle a little tighter because the sprite is egg shaped.
        self.physicsBody = SKPhysicsBody(circleOfRadius: self.size.height / 3, center: self.anchorPoint)
        self.physicsBody?.dynamic = true
        self.physicsBody?.categoryBitMask = Contact.Player
        self.physicsBody?.collisionBitMask = Contact.Scene
        self.physicsBody?.contactTestBitMask = Contact.Scene | Contact.Log | Contact.Score
    }
    
    private func setupPlayerAnimation() {
        let frame0 = GameTextures.sharedInstance.textureWithName(name: SpriteName.Player0)
        let frame1 = GameTextures.sharedInstance.textureWithName(name: SpriteName.Player1)
        
        let animation = SKAction.animateWithTextures([frame0, frame1], timePerFrame: 0.1)
        
        self.runAction(SKAction.repeatActionForever(animation), withKey: self.animationName)
    }
    
    // MARK: - Update
    func update() {
        if self.physicsBody!.velocity.dy > 30.0 {
            self.zRotation = CGFloat(M_PI / 6.0)
        } else if self.physicsBody!.velocity.dy < -100.0 {
            self.zRotation = CGFloat(-1 * (M_PI_4))
        } else {
            self.zRotation = 0.0
        }
    }
    
    // MARK: - Actions
    func fly () {
        var impulse = CGVectorMake(0, 0)
        
        // Is the device retina? (.scale == 2.0)
        if UIScreen.mainScreen().scale == 2.0 {
            impulse = kDeviceTablet ? CGVectorMake(0, 150) : CGVectorMake(0, 20)
        } else {
            impulse = kDeviceTablet ? CGVectorMake(0, 220) : CGVectorMake(0, 20)
        }
        
        
        self.physicsBody!.velocity = CGVectorMake(0, 0)
        self.physicsBody!.applyImpulse(impulse)
    }
    
    // MARK: - Update Score
    func updateScore() {
    }
    
    func getScore() -> Int {
        return self.score
    }
    
    // MARK: - Actions
    func crashed() {
    }
    
    func smacked() {
    }
    
    // MARK: - Game Over
    func gameOver() {
    }
}

