//
//  Colors.swift
//  FloppyBurd
//
//  Created by Jeremy Novak on 2/22/16.
//  Copyright © 2016 Jeremy Novak. All rights reserved.
//

import SpriteKit

class Colors {
    
    class var Background:Int    { return 0x4ba3ff }
    class var Score:Int         { return 0xffffff }
    class var Scoreboard:Int    { return 0x000000 }
    class var Message:Int       { return 0xffd746 }
    class var Flash:Int         { return 0xe82c0b }
    
    
    class func colorFromRGB(rgbvalue rgbValue: Int) -> SKColor {
        return SKColor(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: 1.0)
    }
}
