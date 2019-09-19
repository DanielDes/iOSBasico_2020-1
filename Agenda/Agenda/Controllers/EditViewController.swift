//
//  EditViewController.swift
//  Agenda
//
//  Created by L Daniel De San Pedro on 9/18/19.
//  Copyright © 2019 L Daniel De San Pedro. All rights reserved.
//

import UIKit

class EditViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {

    
    //Outlets
    @IBOutlet weak var profileImageButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nickNameLabel: UITextField!
    @IBOutlet weak var bioTextView: UITextView!
    @IBOutlet weak var birthdayDatePicker: UIDatePicker!
    
    var profileImageURL : URL!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.profileImageButton.layer.masksToBounds = true
        self.profileImageButton.layer.cornerRadius = self.profileImageButton.bounds.width / 2
        
        self.bioTextView.layer.masksToBounds = true
        self.bioTextView.layer.cornerRadius = 5
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(gestureRecognizer)
        // Do any additional setup after loading the view.
    }
    
    @objc func hideKeyboard(){
        self.bioTextView.resignFirstResponder()
        self.nameTextField.resignFirstResponder()
        self.nickNameLabel.resignFirstResponder()
    }
    
    @IBAction func saveChanges(_ sender: Any) {
        //Iniciamos UserDefaults
        let standardUserDefaults = UserDefaults.standard
        
        //Si la información existe la guardamos en disco
        
        if let imageURL = self.profileImageURL {
            standardUserDefaults.set(imageURL.path, forKey: "profile_url")
        }
        
        if let name = self.nameTextField.text {
            standardUserDefaults.set(name, forKey: "name")
        }
        
        if let nickName = self.nickNameLabel.text {
            standardUserDefaults.set(nickName, forKey: "nick_name")
        }
        
        if let bio = self.bioTextView.text {
            standardUserDefaults.set(bio, forKey: "bio")
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let birthDate = self.birthdayDatePicker.date
        let date = dateFormatter.string(from: birthDate)
        standardUserDefaults.set(date, forKey: "birthday")
        
        self.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func takeProfilePicture(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Prifle Picture", message: "Choose picture source ", preferredStyle: .actionSheet)
        let cameraOption = UIAlertAction(title: "Camera", style: .default) { (action) in
            self.displayImagePicker(sourceType: .camera)
        }
        let libraryOption = UIAlertAction(title: "Photo Library", style: .default) { (action) in
            self.displayImagePicker(sourceType: .photoLibrary)
        }
        let cancelOption = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        actionSheet.addAction(cameraOption)
        actionSheet.addAction(libraryOption)
        actionSheet.addAction(cancelOption)
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func displayAlert(withTitle title: String, withMessage message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let acceptAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(acceptAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func displayImagePicker(sourceType: UIImagePickerController.SourceType){
        if !UIImagePickerController.isSourceTypeAvailable(sourceType){
            self.displayAlert(withTitle: "Error", withMessage: "Source not available")
            return
        }
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    //UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else {return}
        
        let imageName = UUID().uuidString + ".png"
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
        
        self.profileImageURL = imagePath
        
        if let pngData = image.pngData(){
            try? pngData.write(to: imagePath)
        }
        self.profileImageButton.setBackgroundImage(image, for: .normal)
        
        dismiss(animated: true, completion: nil)
    }
}
