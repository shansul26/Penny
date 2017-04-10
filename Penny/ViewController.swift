//
//  ViewController.swift
//  Penny
//
//  Created by Shannon Sullivan on 3/18/17.
//  Copyright © 2017 Project Penny. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GIDSignInUIDelegate {
    
    @IBAction func signOutWasPressed(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signInSilently()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

