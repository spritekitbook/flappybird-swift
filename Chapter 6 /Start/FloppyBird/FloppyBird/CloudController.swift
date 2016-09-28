//
//  CloudController.swift
//  FloppyBird
//
//  Created by Jeremy Novak on 9/26/16.
//  Copyright © 2016 SpriteKit Book. All rights reserved.
//

import SpriteKit

class CloudController:SKNode {
    
    // MARK: - Private class constants
    private let largeCloud = Cloud(cloudSize: .large)
    private let mediumCloud = Cloud(cloudSize: .medium)
    private let smallCloud = Cloud(cloudSize: .small)
    
    // MARK: - Private class variables
    private var cloudArray = [Cloud]()
    private var frameCount:TimeInterval = 0.0
    
    // MARK: Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        super.init()
        
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        cloudArray = [largeCloud, mediumCloud, smallCloud]
        
        // Spawn the first clouds
        self.run(SKAction.wait(forDuration: 0.25), completion: {
            [weak self] in
            self?.spawnFirst()
        })
    }
    
    // MARK: - Spawn
    private func spawn() {
        let randomIndex = RandomIntegerBetween(min: 0, max: cloudArray.count - 1)
        
        let randomSpeed = RandomFloatBetween(min: 6.0, max: 12.0)
        
        let cloud = cloudArray[randomIndex].copy() as! Cloud
        
        let startX = kViewSize.width + cloud.size.width
        let startY = RandomFloatBetween(min: kViewSize.height * 0.3, max: kViewSize.height * 0.8)
        
        cloud.position = CGPoint(x: startX, y: startY)
        
        cloud.moveSpeed = randomSpeed
        
        self.addChild(cloud)
    }
    
    private func spawnFirst() {
        let randomCloudIndex = RandomIntegerBetween(min: 0, max: 2)
        
        let startX = RandomFloatBetween(min: kViewSize.width * 0.3, max: kViewSize.width * 0.7)
        let startY = RandomFloatBetween(min: kViewSize.height * 0.3, max: kViewSize.height * 0.7)
        
        let cloud = cloudArray[randomCloudIndex].copy() as! Cloud
        
        let randomSpeed = RandomFloatBetween(min: 6.0, max: 12.0)
        
        cloud.moveSpeed = randomSpeed
        
        cloud.position = CGPoint(x: startX, y: startY)
        
        self.addChild(cloud)
    }
    
    // MARK: - Update
    func update(delta: TimeInterval) {
        frameCount += delta
        
        if self.frameCount >= 5.0 {
            spawn()
            
            frameCount = 0.0
        }
        
        for node in self.children {
            if let cloud = node as? Cloud {
                cloud.update(delta: delta)
            }
        }
    }
}
