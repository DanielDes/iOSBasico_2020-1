//
//  ViewController.swift
//  Programatic Segues
//
//  Created by L Daniel De San Pedro on 9/5/19.
//  Copyright © 2019 L Daniel De San Pedro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var `switch`: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let name = User.currentUser?.name else {return}
        let greeting = "Hi " + name
        self.greetingLabel.text = greeting
    }
    @IBAction func logOut(_ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: nil)
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

