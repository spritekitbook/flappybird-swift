//
//  Contact.swift
//  FloppyBurd
//
//  Created by Jeremy Novak on 2/22/16.
//  Copyright © 2016 Jeremy Novak. All rights reserved.
//

import Foundation


class Contact {
    class var Scene:UInt32      { return 1 << 0 }
    class var Log:UInt32        { return 1 << 1 }
    class var Player:UInt32     { return 1 << 2 }
    class var Score:UInt32      { return 1 << 3 }
}