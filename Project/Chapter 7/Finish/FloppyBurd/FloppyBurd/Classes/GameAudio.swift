//
//  GameAudio.swift
//  FloppyBurd
//
//  Created by Jeremy Novak on 2/24/16.
//  Copyright © 2016 Jeremy Novak. All rights reserved.
//

import SpriteKit
import AVFoundation

class SoundName {
    
    // Interface Sound Names
    class var Button:String         { return "Pop.caf" }
    
    // Flying Sound Names
    class var Flap:String           { return "Flap.caf" }
    
    // Crash Sound Names
    class var Crash:String          { return "Crash.caf" }
    class var Fall:String           { return "Fall.caf" }
    class var Smack:String          { return "Smack.caf" }
    
    // Score Sound Names
    class var Score:String          { return "Score.caf" }
    class var HighScore:String      { return "HighScore.caf" }
}


let GameAudioSharedInstance = GameAudio()

class GameAudio {
    
    class var sharedInstance:GameAudio {
        return GameAudioSharedInstance
    }
    
    // MARK: - Public class constants
    // Interface Sound Actions
    let buttonSound = SKAction.playSoundFileNamed(SoundName.Button, waitForCompletion: false)
    
    // Flying Sound Actions
    let flapSound = SKAction.playSoundFileNamed(SoundName.Flap, waitForCompletion: false)
    
    // Crashing Sound Actions
    let crashSound = SKAction.playSoundFileNamed(SoundName.Crash, waitForCompletion: false)
    let fallSound = SKAction.playSoundFileNamed(SoundName.Fall, waitForCompletion: false)
    let smackSound = SKAction.playSoundFileNamed(SoundName.Smack, waitForCompletion: false)
    
    // Score Sound Actions
    let scoreSound = SKAction.playSoundFileNamed(SoundName.Score, waitForCompletion: false)
    let highScoreSound = SKAction.playSoundFileNamed(SoundName.HighScore, waitForCompletion: false)
    
    // MARK: - Public class constants
    internal let gameMusic = "Pixel Adventures.mp3"
    
    // MARK: - Private class variables
    private var musicPlayer = AVAudioPlayer()
    
    // MARK: - Public class variables
    internal var initialized = false
    
    // MARK: - Music player
    func playBackgroundMusic(fileName fileName: String) {
        let music = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(fileName, ofType: nil)!)
        
        do {
            self.musicPlayer = try AVAudioPlayer(contentsOfURL: music)
        } catch let error as NSError {
            if kDebug {
                print(error)
            }
        }
        
        self.musicPlayer.numberOfLoops = -1
        self.musicPlayer.volume = 0.25
        self.musicPlayer.prepareToPlay()
        self.musicPlayer.play()
        
        self.initialized = true
    }
    
    func stopBackgroundMusic () {
        if self.musicPlayer.playing {
            self.musicPlayer.stop()
        }
    }
    
    func pauseBackgroundMusic () {
        if self.musicPlayer.playing {
            self.musicPlayer.pause()
        }
    }
    
    func resumeBackgroundMusic () {
        if self.initialized {
            self.musicPlayer.play()
        }
    }
    
}
