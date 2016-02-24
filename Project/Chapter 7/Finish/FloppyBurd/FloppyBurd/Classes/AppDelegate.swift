//
//  AppDelegate.swift
//  floppyburd
//
//  Created by Jeremy Novak on 2/20/16.
//  Copyright © 2016 Jeremy Novak. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Pause the music
        GameAudio.sharedInstance.pauseBackgroundMusic()
    }

    func applicationDidEnterBackground(application: UIApplication) {
    }

    func applicationWillEnterForeground(application: UIApplication) {
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Resume the music
        GameAudio.sharedInstance.resumeBackgroundMusic()
    }

    func applicationWillTerminate(application: UIApplication) {
    }


}

