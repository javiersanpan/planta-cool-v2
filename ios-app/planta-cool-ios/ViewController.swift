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
        // Do any additional setup after loading the view.
        
        // FirebaseAnalytics event to check connection
        Analytics.logEvent("InitScreen", parameters: ["message":"Firebase Integration successful"])
        
        // Database test
        let object: [String: Any] = [
            "regar": 0 as NSObject,
            "humedad": "detectando el ",
            "tanque": "detectando..."
        ]
        database.child("test").setValue(object)
    }


}

