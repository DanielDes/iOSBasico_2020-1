//
//  ViewController.swift
//  Agenda
//
//  Created by L Daniel De San Pedro on 9/17/19.
//  Copyright © 2019 L Daniel De San Pedro. All rights reserved.
//

import UIKit

class ContactsViewController: UICollectionViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    
    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people.count
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "person", for: indexPath) as? PersonCollectionViewCell else {
            fatalError("Unable to dequeue cell ")
        }
        
        let person = people[indexPath.row]
        cell.nameLabel.text = person.name
        
        let path = getDocumentsDirectory().appendingPathComponent(person.image)
        cell.personImageView.image = UIImage(contentsOfFile: path.path)
        
        cell.personImageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
        cell.personImageView.layer.borderWidth = 2
        cell.personImageView.layer.cornerRadius = 3
        cell.layer.cornerRadius = 7
        
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var person = people[indexPath.item]
        
        let alertController = UIAlertController(title: "Rename Person", message: nil, preferredStyle: .alert)
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (alert) in
            guard let newName = alertController.textFields?[0].text else {return}
            self.people[indexPath.item].name = newName
            self.collectionView.reloadData()
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func displayAlert(withTitle title: String, withMessage message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let acceptAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(acceptAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func displayCamera(){
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            self.displayAlert(withTitle: "Camera not available", withMessage: "There is no camera on your device")
            return
        }
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
        
    }
    func displayPhotoLibrary(){
        if !UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            self.displayAlert(withTitle: "Photo Library not available", withMessage: "Photo Library not accesible")
            return
        }
        
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else {return}
        
        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
        
        if let jpegData = image.jpegData(compressionQuality: 0.8){
            try? jpegData.write(to: imagePath)
            
        }
        
        let newPerson = Person(name: "Unkown", image: imageName)
        people.append(newPerson)
        self.collectionView.reloadData()
        
        dismiss(animated: true, completion: nil)
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    @IBAction func addPerson(){
        let alertView = UIAlertController(title: "Photo Source", message: "Choose a photo source", preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
            self.displayCamera()
        }
        let photoAction = UIAlertAction(title: "Photo Library", style: .default) { (action) in
            self.displayPhotoLibrary()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertView.addAction(cameraAction)
        alertView.addAction(photoAction)
        alertView.addAction(cancelAction)
        self.present(alertView, animated: true, completion: nil)
    }

}

