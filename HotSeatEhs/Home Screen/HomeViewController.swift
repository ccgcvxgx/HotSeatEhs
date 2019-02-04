//
//  HomeViewController.swift
//  HotSeatEhs
//
//  Created by Trent on 1/5/19.
//  Copyright © 2019 district196.org. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var classes = [Period]()

    @IBAction func editButton(_ sender: Any) {
        performSegue(withIdentifier: "HomeEdit", sender: self)
    }
    
    @IBAction func addPeriod(_ sender: Any) {

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let popup = segue.destination as! PopUpVC
        popup.onAdd = onAdd
    }
    func onAdd(_ n: UITextField, _ r: UITextField, _ c: UITextField) -> Void {
        let names =  n.text!
        let row = Int(r.text!)
        let col = Int(c.text!)
        classes.append(Period(name: names, rows: row!, columns: col!))
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            // delete item at indexPath
            self.classes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            print(self.classes)
        }
        
        //let edit = UITableViewRowAction(style: .default, title: "Edit") { (action, indexPath) in
        //    performSegue(withIdentifier: "HomeEdit", sender: self)
        //}
        
        //edit.backgroundColor = UIColor.lightGray
        
        return [delete]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return classes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: homeCellIdentifier, for: indexPath) as? HomeTableViewCell  else {
            fatalError("The dequeued cell is not an instance of HomeTableViewCell.")
        }
        
        // Configure the cell...
        let period = classes[indexPath.row]
        cell.textLabel?.text = period.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
 //       performSegue(withIdentifier: "HomeRun", sender: self)
    }
}
