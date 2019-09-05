//
//  ViewController.swift
//  AppFlow
//
//  Created by L Daniel De San Pedro on 9/5/19.
//  Copyright © 2019 L Daniel De San Pedro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindToBegining(unwindSegue: UIStoryboardSegue) {
        print("I'm out...")
    }

}

