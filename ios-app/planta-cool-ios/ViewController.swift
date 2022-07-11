//
//  ViewController.swift
//  planta-cool-ios
//
//  Created by Javier on 9/7/22.
//

import UIKit
import FirebaseDatabase
import FirebaseAnalytics

class ViewController: UIViewController {
    
    private let database = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Database test
        // Set regar to 0
        /* let object: [String: Any] = [
            "regar": 0 as Int,
        ] */
        database.child("test").updateChildValues(["regar": 0 as Int])
    }

    @IBAction func regar(_ sender: UIButton) {
        database.child("test").updateChildValues(["regar": 1 as Int])
    }
    
}

