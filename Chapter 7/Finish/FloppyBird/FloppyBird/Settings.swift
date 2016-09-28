//
//  Settings.swift
//  FloppyBird
//
//  Created by Jeremy Novak on 9/27/16.
//  Copyright © 2016 SpriteKit Book. All rights reserved.
//

import Foundation

class Settings {
    
    static let sharedInstance = Settings()
    
    // MARK: - Private class constants
    private let defaults = UserDefaults.standard
    private let keyFirstRun = "First Run"
    private let keyBestScore = "Best Score"
    
    // MARK: - Init
    init() {
        if defaults.object(forKey: keyFirstRun) == nil {
            firstLaunch()
        }
    }
    
    private func firstLaunch() {
        defaults.set(0, forKey: keyBestScore)
        defaults.set(false, forKey: keyFirstRun)
        
        defaults.synchronize()
    }
    
    // MARK: - Public saving methods
    func saveBest(score: Int) {
        defaults.set(score, forKey: keyBestScore)
        
        defaults.synchronize()
    }
    
    // MARK: - Public retrieving methods
    func getBestScore() -> Int {
        return defaults.integer(forKey: keyBestScore)
    }
}
