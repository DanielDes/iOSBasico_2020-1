//
//  ViewController.swift
//  Programatic Segues
//
//  Created by L Daniel De San Pedro on 9/5/19.
//  Copyright © 2019 L Daniel De San Pedro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var `switch`: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func goToYellow(_ sender: Any) {
        if self.switch.isOn {
            performSegue(withIdentifier: "yellow", sender: nil)
        }
    }
    @IBAction func goToGreen(_ sender: Any) {
        if self.switch.isOn {
            performSegue(withIdentifier: "green", sender: nil)
        }
    }
}

