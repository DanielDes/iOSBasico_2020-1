//
//  SignInViewController.swift
//  Programatic Segues
//
//  Created by L Daniel De San Pedro on 9/10/19.
//  Copyright © 2019 L Daniel De San Pedro. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController,UITextFieldDelegate {

    // Variables y Outlets
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextField.delegate = self
        self.passwordTextField.delegate = self
        self.confirmTextField.delegate = self
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        self.view.addGestureRecognizer(gesture)
    }
    
    @IBAction func signIn(_ sender: Any) {
        //Leemos datos de nuestro nuevo usuario
        guard let name = nameTextField.text else {return}
        
        guard let password = passwordTextField.text else {return}
        
        guard let confirmPassword = confirmTextField.text else {return}
        
        if password != confirmPassword {
            return
        }
        //Guardamos el dato de nuestro usuario
        
        let userDeaults = UserDefaults.standard
        userDeaults.set(password, forKey: name)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    @objc func hideKeyboard(){
        self.nameTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        self.confirmTextField.resignFirstResponder()
    }
}
