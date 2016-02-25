//
//  GameViewController.swift
//  floppyburd
//
//  Created by Jeremy Novak on 2/20/16.
//  Copyright (c) 2016 Jeremy Novak. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if let skView = self.view as? SKView {
            if (skView.scene == nil) {
                
                if kDebug {
                    skView.showsFPS = true
                    skView.showsPhysics = true
                }
                
                skView.ignoresSiblingOrder = false
                
                let menuScene = MenuScene(size: kViewSize)
                menuScene.scaleMode = SKSceneScaleMode.AspectFill
                
                let menuTransition = SKTransition.fadeWithColor(SKColor.blackColor(), duration: 0.25)
                
                skView.presentScene(menuScene, transition: menuTransition)
            }
        }
    }

//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        
//        if let skView = self.view as? SKView {
//            if (skView.scene == nil) {
//                
//                skView.showsFPS = true
//                skView.showsPhysics = true
//                
//                skView.ignoresSiblingOrder = false
//                
//                let menuScene = GameScene(size: UIScreen.mainScreen().bounds.size)
//                menuScene.scaleMode = SKSceneScaleMode.AspectFill
//                
//                let menuTransition = SKTransition.fadeWithColor(SKColor.blackColor(), duration: 0.25)
//                
//                skView.presentScene(menuScene, transition: menuTransition)
//            }
//        }
//    }
    
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }}
