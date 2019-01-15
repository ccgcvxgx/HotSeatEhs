//
//  DataSource.swift
//  HotSeatEhs
//
//  Created by Trent on 1/5/19.
//  Copyright © 2019 district196.org. All rights reserved.
//

import UIKit

class DataSource: NSObject, UITableViewDataSource {
    
    //MARK: Properties
    
    var classes = [Period]()
    
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? HomeTableViewCell  else {
            fatalError("The dequeued cell is not an instance of HomeTableViewCell.")
        }
        
        // Configure the cell...
        let period = classes[indexPath.row]
        cell.textLabel?.text = period.name
        
        return cell
    }
}
