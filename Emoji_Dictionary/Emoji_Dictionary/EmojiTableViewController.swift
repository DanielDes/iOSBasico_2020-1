//
//  EmojiTableViewController.swift
//  Emoji_Dictionary
//
//  Created by L Daniel De San Pedro on 9/30/19.
//  Copyright © 2019 L Daniel De San Pedro. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    var emojis : [Emoji] = [Emoji(symbol: "😱", name: "Espantado", usage: "Cuando estoy espantado", description: "Una carita con espanto"),Emoji(symbol: "😱", name: "Espantado", usage: "Cuando estoy espantado", description: "Una carita con espanto"),Emoji(symbol: "😱", name: "Espantado", usage: "Cuando estoy espantado", description: "Una carita con espanto"),Emoji(symbol: "😱", name: "Espantado", usage: "Cuando estoy espantado", description: "Una carita con espanto")]
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.editButton.possibleTitles = ["Done","Edit"]
        
    }
    
    @IBAction func editTableView(_ sender: Any) {
        let editingMode = self.tableView.isEditing
        tableView.setEditing(!editingMode, animated: true)
        
        
        //Operador ternario
        let title = !editingMode ? "Done" : "Edit"
        //Para que funcione el UIBarButtonItem del storyboard debe de estar configurado como custom
        self.editButton.title = title
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return emojis.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emojiCell", for: indexPath)
        let emoji = emojis[indexPath.row]
        cell.textLabel?.text = "\(emoji.name) - \(emoji.symbol)"
        cell.detailTextLabel?.text = emoji.description
        cell.showsReorderControl = true
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedEmoji = emojis.remove(at: sourceIndexPath.row)
        emojis.insert(movedEmoji, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditEmoji" {
            let indexPath = tableView.indexPathForSelectedRow!
            let emoji = emojis[indexPath.row]
            let navController = segue.destination as! UINavigationController
            let addEmoji = navController.topViewController as! AddEmojiTableViewController
            addEmoji.emoji = emoji
        }
    }
    
    @IBAction func unwindFromAddEmoji(_ sender: UIStoryboardSegue) {
        guard sender.identifier == "saveUnwind" else {return}
        
        let sourceViewController = sender.source as! AddEmojiTableViewController
        
        if let emoji = sourceViewController.emoji {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                emojis[selectedIndexPath.row] = emoji
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                let newIndexPath = IndexPath(row: emojis.count, section: 0)
                emojis.append(emoji)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }
}
