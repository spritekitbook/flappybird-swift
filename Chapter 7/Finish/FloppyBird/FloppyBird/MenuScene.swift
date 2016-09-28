//
//  MenuScene.swift
//  FloppyBird
//
//  Created by Jeremy Novak on 9/24/16.
//  Copyright © 2016 SpriteKit Book. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    
    // MARK: - Private class constants
    private let cloudController = CloudController()
    private let hills = Hills()
    private let ground = Ground()
    private let title = Title()
    private let logo = Logo()
    private let playButton = PlayButton()
    
    // MARK: - Private class variables
    private var lastUpdateTime:TimeInterval = 0.0
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    override func didMove(to view: SKView) {
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        self.backgroundColor = Colors.colorFrom(rgb: Colors.sky)
        
        self.addChild(cloudController)
        self.addChild(hills)
        self.addChild(ground)
        self.addChild(title)
        self.addChild(logo)
        self.addChild(playButton)
    }
    
    // MARK: - Update
    override func update(_ currentTime: TimeInterval) {
        let delta = currentTime - lastUpdateTime
        lastUpdateTime = currentTime
        
        cloudController.update(delta: delta)
    }
    
    // MARK: - Touch Events
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first! as UITouch
        let touchLocation = touch.location(in: self)
        
        if playButton.contains(touchLocation) {
            loadScene()
        }
    }
    
    // MARK: - Load Scene
    private func loadScene() {
        let scene = GameScene(size: kViewSize)
        let transition = SKTransition.fade(with: SKColor.black, duration: 0.5)
        
        self.view?.presentScene(scene, transition: transition)
    }
}
