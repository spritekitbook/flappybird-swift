//
//  GameViewController.swift
//  FloppyBird
//
//  Created by Jeremy Novak on 9/24/16.
//  Copyright © 2016 SpriteKit Book. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if let view = self.view as! SKView? {
            if view.scene == nil {
                if kDebug {
                    view.showsFPS = true
                    view.showsDrawCount = true
                    view.showsNodeCount = true
                    view.showsPhysics = true
                }
                
                let scene = MenuScene(size: kViewSize)
                let transition = SKTransition.fade(with: SKColor.black, duration: 0.5)
                
                view.presentScene(scene, transition: transition)
            }
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
