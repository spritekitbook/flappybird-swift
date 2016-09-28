//
//  Sound.swift
//  FloppyBird
//
//  Created by Jeremy Novak on 9/28/16.
//  Copyright © 2016 SpriteKit Book. All rights reserved.
//

import SpriteKit
import AVFoundation

enum SoundEffect {
    case crash, fall, flap, highScore, pop, score, smack
}

class Sound {
    
    static let sharedInstance = Sound()
    
    // MARK: - Private class constants
    private let music = "Pixel Adventures.mp3"
    private let crashSound = "Crash.caf"
    private let fallSound = "Fall.caf"
    private let flapSound = "Flap.caf"
    private let highScoreSound = "HighScore.caf"
    private let popSound = "Pop.caf"
    private let scoreSound = "Score.caf"
    private let smackSound = "Smack.caf"
    
    // MARK: - Private class variables
    private var player = AVAudioPlayer()
    private var initialized = false
    
    // MARK: - Music player
    func playMusic() {
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: music, ofType: nil)!)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
        } catch let error as NSError {
            NSLog("Error playing music: %@", error)
        }
        
        player.numberOfLoops = -1
        player.volume = 0.25
        player.prepareToPlay()
        player.play()
        
        initialized = true
    }
    
    func stopMusic() {
        if player.isPlaying {
            player.stop()
        }
    }
    
    func pauseMusic() {
        if player.isPlaying {
            player.pause()
        }
    }
    
    func resumeMusic() {
        if initialized {
            player.play()
        }
    }
    
    // MARK: - Sound Effects
    func playSound(sound: SoundEffect) -> SKAction {
        var file = String()
        
        switch sound {
        case .crash:
            file = crashSound
            
        case .fall:
            file = fallSound
            
        case .flap:
            file = flapSound
            
        case .highScore:
            file = highScoreSound
            
        case .pop:
            file = popSound
            
        case .score:
            file = scoreSound
            
        case .smack:
            file = smackSound
        }
        
        return SKAction.playSoundFileNamed(file, waitForCompletion: false)
    }
}
