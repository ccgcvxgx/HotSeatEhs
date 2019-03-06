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
    
    
    @IBAction func addPeriod(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbPopUpID") as! PopUpVC
        self.present(popOverVC, animated: true)
    }
    
    func onAdd(_ n: UITextField, _ r: UITextField, _ c: UITextField) -> Void {
        let names =  n.text!
        let row = Int(r.text!)
        let col = Int(c.text!)
        let p = Period(name: names, rows: row!, columns: col!)
        list.append(p)
        ClassArray().archive(fileName: "HomeScreen")
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let num = indexPath.row
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            // delete item at indexPath
            list.remove(at: num)
            ClassArray().archive(fileName: "HomeScreen")
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
            }
        return [delete]
    }
        /*let edit = UITableViewRowAction(style: .default, title: "Edit") { (action, indexPath) in
            //move to edit screen
            self.performSegue(withIdentifier: "HomeEdit", sender: self)
        }
        edit.backgroundColor = UIColor.lightGray
        
        return [delete,edit]
        
    }*/
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "HomeEdit" {
            _ = self.tableView.indexPathForSelectedRow
            _ = segue.destination as! EditScreen
            
        }
    }*/

    override func viewDidLoad() {
        super.viewDidLoad()
        ClassArray().restore(fileName: "HomeScreen")
        tableView.dataSource = self
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
    @objc func loadList(notification: NSNotification){
        //load data here
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: homeCellIdentifier, for: indexPath) as? HomeTableViewCell  else {
            fatalError("The dequeued cell is not an instance of HomeTableViewCell.")
        }
        // Configure the cell...
        let period = list[indexPath.row]
        cell.textLabel?.text = period.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let per = list[indexPath.row]
        classIndex = list.firstIndex(of: per)!
        performSegue(withIdentifier: "HomeRun", sender: self)
    }
}
