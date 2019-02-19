//
//  EditScreen.swift
//  HotSeatEhs
//
//  Created by Andrea on 12/29/18.
//  Copyright © 2018 district196.org. All rights reserved.
//

import UIKit

class EditScreen: UIViewController, UITableViewDataSource, UICollectionViewDataSource {
    
    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var TableView: UITableView!
    
    var collectionCells: [Seat] = []
    var tableCells: [Seat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func collectionArr() -> [Seat] {
        collectionCells = list[classIndex].seatingChart
        return collectionCells
    }
    
    func tableArr() -> [Seat] {
        tableCells = list[classIndex].seatingChart
        return tableCells
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let table = list[classIndex]
        let cell = tableView.dequeueReusableCell(withIdentifier: "EditScreenTableViewCell", for: indexPath) as! EditScreenTableViewCell
        
        cell.seatID.text = table.seatingChart[seatIndex].id
        cell.studentName.text = "Andrea"
        cell.textLabel?.text = table.seatingChart[indexPath.row].studentName
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionCells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collection = list[classIndex]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EditScreenCollectionViewCell", for: indexPath) as! EditScreenCollectionViewCell
        
        cell.cellID.text = collection.seatingChart[indexPath.row].studentName
        
        return cell
    }
}
