//
//  AddEmojiTableViewController.swift
//  Emoji_Dictionary
//
//  Created by L Daniel De San Pedro on 10/1/19.
//  Copyright © 2019 L Daniel De San Pedro. All rights reserved.
//

import UIKit

class AddEmojiTableViewController: UITableViewController {
    
    var emoji : Emoji!
    
    @IBOutlet weak var symbolTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var usageTetField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let emoji = emoji {
            self.symbolTextField.text = emoji.symbol
            self.nameTextField.text = emoji.name
            self.usageTetField.text = emoji.usage
            self.descriptionTextField.text = emoji.description
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveUnwind" else {return}
        let symbol = symbolTextField.text ?? ""
        let name = nameTextField.text ?? ""
        let description = descriptionTextField.text ?? ""
        let usage = usageTetField.text ?? ""
        
        emoji = Emoji(symbol: symbol, name: name, usage: usage, description: description)
    }
}
