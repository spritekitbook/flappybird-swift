//
//  LogController.swift
//  FloppyBurd
//
//  Created by Jeremy Novak on 2/23/16.
//  Copyright © 2016 Jeremy Novak. All rights reserved.
//

import SpriteKit

class LogController:SKNode {
    
    // MARK: - Private class constants
    private let bottomLog = Log(logType: Log.LogType.Bottom)
    private let topLog = Log(logType: Log.LogType.Top)
    private let logGap:CGFloat = 250.0
    
    // MARK: - Private class variables
    private var logArray = [SKSpriteNode]()
    private var scoreNode = ScoreNode()
    private var frameCount:NSTimeInterval = 0.0
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        super.init()
        
        self.setupLogController()
    }
    
    // MARK: - Setup
    private func setupLogController() {
        self.logArray = [self.bottomLog, self.topLog]
        
        self.scoreNode = ScoreNode(size: self.bottomLog.size)
    }
    
    // MARK: - Update
    func update(delta delta: NSTimeInterval) {
        self.frameCount += delta
        
        if self.frameCount >= 2.0 {
            self.spawnLogs()
            
            self.frameCount = 0.0
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
    
    // MARK: - Actions
    func spawnLogs() {
        // Random Y position on screen
        let randomY = CGFloat(Int(arc4random_uniform(UInt32(UInt(kViewSize.height / 3)))))
        
        let newBottomLog = self.logArray[0].copy() as! Log
        let newTopLog = self.logArray[1].copy() as! Log
        let newScoreNode = self.scoreNode.copy() as! ScoreNode
        
        newBottomLog.position = CGPoint(x: kViewSize.width + newBottomLog.size.width, y: randomY)
        newTopLog.position = CGPoint(x: newBottomLog.position.x, y: newBottomLog.position.y + newBottomLog.size.height + self.logGap)
        newScoreNode.position = CGPoint(x: newBottomLog.position.x + newBottomLog.size.width * 0.75, y: kViewSize.height / 2)
        
        
        self.addChild(newBottomLog)
        self.addChild(newTopLog)
        self.addChild(newScoreNode)
    }
}
