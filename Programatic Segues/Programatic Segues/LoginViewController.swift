//
//  LoginViewController.swift
//  Programatic Segues
//
//  Created by L Daniel De San Pedro on 9/5/19.
//  Copyright © 2019 L Daniel De San Pedro. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var passwordTexField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userTextField.delegate = self
        self.passwordTexField.delegate = self
        
        let gesture = UITapGestureRecognizer(target: self, action:
            #selector(self.hideKeyboard))
        self.view.addGestureRecognizer(gesture)
    }
    
    @IBAction func go(_ sender: Any) {
        guard let name = self.userTextField.text else {return}
        guard let password = self.passwordTexField.text else {return}
        let userDefaults = UserDefaults.standard
        guard let storedPassword = userDefaults.value(forKey: name) as? String else {return}
        
        if storedPassword != password {
            return
        }
        User.currentUser = User(name: name, password: password)
        self.performSegue(withIdentifier: "go", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.navigationItem.title = "jello"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        
        return true
    }
    @objc func hideKeyboard() {
        self.userTextField.resignFirstResponder()
        self.passwordTexField.resignFirstResponder()
    }

}
