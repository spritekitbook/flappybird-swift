//
//  GameSettings.swift
//  FloppyBurd
//
//  Created by Jeremy Novak on 2/24/16.
//  Copyright © 2016 Jeremy Novak. All rights reserved.
//

import Foundation

let GameSettingsSharedInstance = GameSettings()

class GameSettings {
    
    class var sharedInstance:GameSettings {
        return GameSettingsSharedInstance
    }
    
    // MARK: - Private class constants
    private let localDefaults = NSUserDefaults.standardUserDefaults()
    private let keyFirstRun = "FirstRun"
    private let keyBestScore = "BestScore"
    
    // MARK: - Init
    init() {
        if self.localDefaults.objectForKey(keyFirstRun) == nil {
            self.firstLaunch()
        }
    }
    
    // MARK: - Private functions
    private func firstLaunch() {
        self.localDefaults.setInteger(0, forKey: self.keyBestScore)
        self.localDefaults.setBool(false, forKey: self.keyFirstRun)
        self.localDefaults.synchronize()
    }
    
    // MARK: - Public saving functions
    func saveBestScore(score score: Int) {
        self.localDefaults.setInteger(score, forKey: keyBestScore)
        self.localDefaults.synchronize()
    }
    
    
    // MARK: - Public retrieving functions
    func getBestScore() -> Int {
        return self.localDefaults.integerForKey(self.keyBestScore)
    }
}

