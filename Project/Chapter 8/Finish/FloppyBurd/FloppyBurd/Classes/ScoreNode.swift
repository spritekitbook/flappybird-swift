//
//  ScoreNode.swift
//  FloppyBurd
//
//  Created by Jeremy Novak on 2/23/16.
//  Copyright © 2016 Jeremy Novak. All rights reserved.
//

import SpriteKit

class ScoreNode:SKNode {
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        super.init()
    }
    
    convenience init(size: CGSize) {
        self.init()
        
        self.setupScoreNodePhysics(size: size)
    }
    
    // MARK: - Setup
    private func setupScoreNode() {
    }
    
    private func setupScoreNodePhysics(size size: CGSize) {
        let nodeSize = CGSizeMake(size.width / 2, kViewSize.height)
        self.physicsBody = SKPhysicsBody(rectangleOfSize: nodeSize)
        self.physicsBody?.dynamic = false
        self.physicsBody?.categoryBitMask = Contact.Score
        self.physicsBody?.collisionBitMask = 0x0
        self.physicsBody?.contactTestBitMask = 0x0
    }
    
    // MARK: - Update
    func update(delta delta: NSTimeInterval) {
        let moveAmount = kDeviceTablet ? CGFloat(delta) * 60 * 4 : CGFloat(delta) * 60 * 2
        
        self.position.x = self.position.x - moveAmount
        
        if self.position.x < (0 - self.frame.size.width) {
            self.removeFromParent()
        }
        
    }
}
