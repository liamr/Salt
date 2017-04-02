//
//  AppDelegate.swift
//  Salt
//
//  Created by Brian on 01/04/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        // Init new empty app
        App.current = App()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

