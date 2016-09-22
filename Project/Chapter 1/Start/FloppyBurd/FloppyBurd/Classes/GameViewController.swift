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
                
                skView.showsFPS = true
                skView.showsPhysics = true
                
                skView.ignoresSiblingOrder = false
                
                let menuScene = GameScene(size: UIScreen.main.bounds.size)
                menuScene.scaleMode = SKSceneScaleMode.aspectFill
                
                let menuTransition = SKTransition.fade(with: SKColor.black, duration: 0.25)
                
                skView.presentScene(menuScene, transition: menuTransition)
            }
        }
    }
    
    
    override var shouldAutorotate : Bool {
        return true
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }}
