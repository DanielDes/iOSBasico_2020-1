//
//  LoginViewController.swift
//  Programatic Segues
//
//  Created by L Daniel De San Pedro on 9/5/19.
//  Copyright © 2019 L Daniel De San Pedro. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var passwordTexField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func go(_ sender: Any) {
        
        if self.userTextField.text != "" && self.passwordTexField.text != ""{
            self.performSegue(withIdentifier: "go", sender: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.navigationItem.title = "jello"
    }
    

}
