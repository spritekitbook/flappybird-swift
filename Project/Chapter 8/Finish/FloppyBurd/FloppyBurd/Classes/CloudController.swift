//
//  CloudController.swift
//  FloppyBurd
//
//  Created by Jeremy Novak on 2/25/16.
//  Copyright © 2016 Jeremy Novak. All rights reserved.
//

import SpriteKit

class CloudController:SKNode {
    
    // MARK: - Private class constants
    private let cloudLarge = Cloud(cloudType: Cloud.CloudType.Large)
    private let cloudMedium = Cloud(cloudType: Cloud.CloudType.Medium)
    private let cloudSmall = Cloud(cloudType: Cloud.CloudType.Small)
    
    // MARK: - Private class variables
    private var cloudArray = [SKSpriteNode]()
    private var frameCount = 0.0
    
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        super.init()
        
        self.setupCloudController()
        
    }
    
    // MARK: - Setup
    private func setupCloudController() {
        // Add each of our cloud types to the cloudArray array
        self.cloudArray = [self.cloudLarge, self.cloudMedium, self.cloudSmall]
        
        // Artificial delay so these clouds will be on screen when update(delta:) tries to move them
        self.runAction(SKAction.waitForDuration(0.25), completion: {
            self.spawnFirstCloud()
        })
    }
    
    // MARK: - Update
    func update(delta delta: NSTimeInterval) {
        self.frameCount += delta
        
        if self.frameCount >= 5.0 {
            self.spawnCloud()
            
            self.frameCount = 0.0
        }
        
        for node in self.children {
            if let cloud = node as? Cloud {
                cloud.update(delta: delta)
            }
        }
    }
    
    // MARK: - Spawning
    private func spawnFirstCloud() {
        let randomCloudIndex = self.randomIntegerBetween(min: 0, max: 2)
        
        let startX = self.randomFloatRange(min: kViewSize.width * 0.3, max: kViewSize.width * 0.7)
        let startY = self.randomFloatRange(min: kViewSize.height * 0.3, max: kViewSize.height * 0.7)
        
        let cloud = self.cloudArray[randomCloudIndex].copy() as! Cloud
        
        let speedX = self.randomCloudSpeed()
        
        cloud.setMovementSpeed(speed: speedX)
        
        cloud.position = CGPoint(x: startX, y: startY)
        
        self.addChild(cloud)
    }
    
    private func spawnCloud() {
        // Get a random index to select a cloud from
        let randomCloudIndex = self.randomIntegerBetween(min: 0, max: 2)
        
        // Starting X is off screen right between one and quadruple the width of cloudLarge
        let startX = self.randomFloatRange(min: kViewSize.width + self.cloudArray[0].size.width, max: self.cloudArray[0].size.width * 4)
        
        // Starting Y is between 30% and 85% up the Y axis
        let startY = self.randomFloatRange(min: kViewSize.height * 0.25, max: kViewSize.height * 0.9)
        
        // Get a copy of the cloud out of the array
        let cloud = self.cloudArray[randomCloudIndex].copy() as! Cloud
        
        // Random movement speed on the X axis
        let speedX = self.randomCloudSpeed()
        cloud.setMovementSpeed(speed: speedX)
        
        // Set the starting position
        cloud.position = CGPoint(x: startX, y: startY)
        
        // Add the cloud to the cloudController node
        self.addChild(cloud)
        
    }
    
    private func randomCloudSpeed() -> CGFloat {
        return kDeviceTablet ? randomFloatRange(min: 12, max: 18) : randomFloatRange(min: 6, max: 12)
    }
    
    private func randomIntegerBetween(min min: Int, max: Int) -> Int {
        return Int(UInt32(min) + arc4random_uniform(UInt32(max - min + 1)))
    }
    
    
    private func randomFloatRange(min min: CGFloat, max: CGFloat) -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF) * (max - min) + min
    }
}
