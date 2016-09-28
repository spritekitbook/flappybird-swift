//
//  LogController.swift
//  FloppyBird
//
//  Created by Jeremy Novak on 9/27/16.
//  Copyright © 2016 SpriteKit Book. All rights reserved.
//

import SpriteKit

class LogController:SKNode {
    
    // MARK: - Private class constants
    private let bottomLog = Log(type: .bottom)
    private let topLog = Log(type: .top)
    private let logGap:CGFloat = 250.0
    
    // MARK: - Private class variables
    private var scoreNode = ScoreNode()
    private var logArray = [Log]()
    private var frameCount:TimeInterval = 0.0
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        super.init()
        
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        logArray = [bottomLog, topLog]
        
        scoreNode = ScoreNode(size: bottomLog.size)
    }
    
    // MARK: - Spawn
    private func spawn() {
        // Random Y position on screen
        let randomY = CGFloat(arc4random_uniform(UInt32(kViewSize.height / 3)))
        
        let newBottomLog = logArray[0].copy() as! Log
        let newTopLog = logArray[1].copy() as! Log
        let newScoreNode = scoreNode.copy() as! ScoreNode
        
        newBottomLog.position = CGPoint(x: kViewSize.width + newBottomLog.size.width, y: randomY)
        newTopLog.position = CGPoint(x: newBottomLog.position.x, y: newBottomLog.position.y + newBottomLog.size.height + logGap)
        
        // Position the newScoreNode just after the bottom log
        newScoreNode.position = CGPoint(x: newBottomLog.position.x + newBottomLog.size.width * 0.75, y: kViewSize.height / 2)
        
        self.addChild(newBottomLog)
        self.addChild(newTopLog)
        self.addChild(newScoreNode)
    }
    
    // MARK: - Update
    func update(delta: TimeInterval) {
        frameCount += delta
        
        if frameCount >= 2.0 {
            spawn()
            
            frameCount = 0.0
        }
        
        for node in self.children {
            if let log = node as? Log {
                log.update(delta: delta)
            }
            
            if let scoreNode = node as? ScoreNode {
                scoreNode.update(delta: delta)
            }
        }
    }
}
