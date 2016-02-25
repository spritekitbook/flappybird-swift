//
//  GameFonts.swift
//  FloppyBurd
//
//  Created by Jeremy Novak on 2/24/16.
//  Copyright © 2016 Jeremy Novak. All rights reserved.
//

import SpriteKit

let GameFontsSharedInstance = GameFonts()

class GameFonts {
    
    class var sharedInstance:GameFonts {
        return GameFontsSharedInstance
    }
    
    // MARK: - Public class enum
    internal enum FontType:Int {
        case ScoreLabel
        case Scoreboard
        case Message
    }
    
    // MARK: - Private class constants
    private let fontName = "Edit Undo BRK"
    private let scoreLabelSize:CGFloat = kDeviceTablet ? 400.0 : 200.0
    private let scoreBoardSize:CGFloat = kDeviceTablet ? 120 : 60.0
    private let messageSize:CGFloat = kDeviceTablet ? 84.0 : 42.0
    
    // MARK: _ Private class variables
    private var label = SKLabelNode()
    
    init() {
        self.setupLabel()
    }
    
    // MARK: - Setup
    private func setupLabel() {
        self.label = SKLabelNode(fontNamed: self.fontName)
    }
    
    // MARK: - Label Creation
    func createLabel(string string: String, fontType: FontType) -> SKLabelNode {
        let copiedLabel = self.label.copy() as! SKLabelNode
        
        switch fontType {
            case FontType.ScoreLabel:
                copiedLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center
                copiedLabel.fontColor = Colors.colorFromRGB(rgbvalue: Colors.Score)
                copiedLabel.fontSize = self.scoreLabelSize
                copiedLabel.text = string
                copiedLabel.alpha = 0.5
                
            case FontType.Scoreboard:
                copiedLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center
                copiedLabel.fontColor = Colors.colorFromRGB(rgbvalue: Colors.Scoreboard)
                copiedLabel.fontSize = self.scoreBoardSize
                copiedLabel.text = string
                
            case FontType.Message:
                copiedLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center
                copiedLabel.fontColor = Colors.colorFromRGB(rgbvalue: Colors.Message)
                copiedLabel.fontSize = self.messageSize
                copiedLabel.text = string
        }
        
        return copiedLabel
    }
}
