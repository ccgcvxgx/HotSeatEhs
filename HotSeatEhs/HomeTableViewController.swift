//
//  HomeTableViewController.swift
//  HotSeatEhs
//
//  Created by Trent on 1/5/19.
//  Copyright © 2019 district196.org. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    var classes = [Period]()
    
    private func makeclasses(){
        let p1 = Period(name:"One",rows: 5, columns: 7)
        let p2 = Period(name:"Two",rows: 5, columns: 7)
        let p3 = Period(name:"Three",rows: 5, columns: 7)
        
        classes.append(contentsOf: [p1,p2,p3])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeclasses()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return classes.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? HomeTableViewCell  else {
            fatalError("The dequeued cell is not an instance of HomeTableViewCell.")
        }
        
        // Configure the cell...
        let period = classes[indexPath.row]
        cell.textLabel?.text = period.name
        
        return cell
    }
    
}
