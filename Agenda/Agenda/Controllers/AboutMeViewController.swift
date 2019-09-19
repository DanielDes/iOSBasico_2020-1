//
//  AboutMeViewController.swift
//  Agenda
//
//  Created by L Daniel De San Pedro on 9/18/19.
//  Copyright © 2019 L Daniel De San Pedro. All rights reserved.
//

import UIKit

class AboutMeViewController: UIViewController {
//Outlets
    
    
    @IBOutlet weak var profileImageview: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.profileImageview.contentMode = .scaleToFill
        self.profileImageview.layer.masksToBounds = true
        self.profileImageview.layer.cornerRadius = self.profileImageview.bounds.width / 2
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("hey")
        setValues()
    }
    
    func setValues(){
        let standardUserDefaults = UserDefaults.standard
        
        if let name = standardUserDefaults.value(forKey: "name") as? String, name != ""
        {
            self.nameLabel.text = name
        }
        if let nickName = standardUserDefaults.value(forKey: "nick_name") as? String, nickName != ""
        {
            self.nickName.text = nickName
        }
        
        if let bio = standardUserDefaults.value(forKey: "bio") as? String, bio != ""
        {
            self.bioLabel.text = bio
        }
        if let birthday = standardUserDefaults.value(forKey: "birthday") as? String, birthday != ""
        {
            self.birthdayLabel.text = birthday
        }
        
        if let imageURL = standardUserDefaults.value(forKey: "profile_url") as? String,
            let profileImage = UIImage(contentsOfFile: imageURL){
            self.profileImageview.image = profileImage
        }
    }

    //Actions
    @IBAction func shareOnSocialMedia(_ sender: Any) {
        
        let text = "Hey my name is \(self.nameLabel.text!)!"
        let activitycontroller = UIActivityViewController(activityItems: [text], applicationActivities: [])
        self.present(activitycontroller, animated: true, completion: nil)
    }
    

}
