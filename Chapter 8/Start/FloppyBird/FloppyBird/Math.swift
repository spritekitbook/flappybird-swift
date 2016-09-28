//
//  Math.swift
//  FloppyBird
//
//  Created by Jeremy Novak on 9/26/16.
//  Copyright © 2016 SpriteKit Book. All rights reserved.
//

import SpriteKit


func RandomIntegerBetween(min: Int, max: Int) -> Int {
    return Int(UInt32(min) + arc4random_uniform(UInt32(max - min + 1)))
}

func RandomFloatBetween(min: CGFloat, max: CGFloat) -> CGFloat {
     return CGFloat(Float(arc4random()) / 0xFFFFFFFF) * (max - min) + min
}
