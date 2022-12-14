//
//  ViewController.swift
//  Grocery
//
//  Created by Alexander Masztak on 12/11/22.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITableViewDataSource {

    var listArray = ["Eggs", "Milk"]
    
    @IBOutlet weak var addItemTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }

    @IBAction func whenAdd(_ sender: UIButton) {
        listArray.append(addItemTextField.text ?? "error")
        tableView.reloadData()
        addItemTextField.text = ""
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        var content =  cell.defaultContentConfiguration()
        content.text = listArray[indexPath.row]
        
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
           self.listArray.remove(at: indexPath.row)
           self.tableView.beginUpdates()
           self.tableView.deleteRows(at: [indexPath], with: .automatic)
           self.tableView.endUpdates()
        }
    }
}

