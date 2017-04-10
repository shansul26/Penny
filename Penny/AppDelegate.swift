//
//  AppDelegate.swift
//  Penny
//
//  Created by Shannon Sullivan on 3/18/17.
//  Copyright © 2017 Project Penny. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //Google sign in
        var configureError: NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
        if (configureError != nil) {
            print("Google auth error: \(configureError)")
        }
        GIDSignIn.sharedInstance().delegate = self
        
        /*FIRApp.configure()
        print("Hello")
        var ref: FIRDatabaseReference!
        ref = FIRDatabase.database().reference()
        ref.child("users").child("1").setValue(["fname": "Sally Joe Bob", "lname":"Smith", "email":"sjb@bjs.com", "username":"sallyjoebob"])
        ref.child("users").child("2").setValue(["fname": "Neil", "lname":"Bantoc", "email":"neilemail@notarealaddress.com", "username":"nbantoc"])
        ref.child("pennies").child("1").setValue(["pennyowner": "1"])
        ref.child("transactions").childByAutoId().setValue(["sender": "1", "receiver": "2", "penny": "1", "timestamp": [".sv": "timestamp"], "privacy":"public"])
        ref.child("requests").child("1").child("2").setValue("true");
        //ref.child("requests").child("1").child("3").setValue("true");
        print("---TIMESTAMP---")
        print(FIRServerValue.timestamp())
        print("---")
        //lol, populating a database
        //ref.child("audience").setValue(["private": "true", "friends": "true", "public":"true"]);*/
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    /*   GOOGLE AUTH METHODS   */
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if(error != nil) {
            print("Sign in error ahoy! \(error)")
        }
        else {
            print("Hello, \(user)")
        }
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool{
        return GIDSignIn.sharedInstance().handle(url as URL!, sourceApplication: sourceApplication, annotation: annotation)
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        if(error != nil){
            print("Sign out error ahoy! \(error)")
        }
        else {
            print("Goodbye, \(user)")
        }
    }

}

