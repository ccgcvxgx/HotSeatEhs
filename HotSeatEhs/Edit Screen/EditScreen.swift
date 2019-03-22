//
//  EditScreen.swift
//  HotSeatEhs
//
//  Created by Andrea on 12/29/18.
//  Copyright © 2018 district196.org. All rights reserved.
//

import UIKit

class EditScreen: UIViewController, UITableViewDataSource, UICollectionViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var TableView: UITableView!
    
    @IBOutlet weak var pName: UILabel!
    
    var collectionCells: [Seat] = []
    var tableCells: [Seat] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let per = list[classIndex]
        let name = per.name
        pName.text = name
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableCells = list[classIndex].seatingChart
        return tableCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let table = list[classIndex]
        let cell = tableView.dequeueReusableCell(withIdentifier: "EditScreenTableViewCell", for: indexPath) as! EditScreenTableViewCell
        let s = table.seatingChart[indexPath.row]
        cell.studentName?.text = s.studentName
        cell.seatID?.text = s.id
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       collectionCells = list[classIndex].seatingChart
        return collectionCells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collection = list[classIndex]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EditScreenCollectionViewCell", for: indexPath) as! EditScreenCollectionViewCell
        let s = collection.seatingChart[indexPath.row]
        cell.cellID.text = s.id
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = TableView.cellForRow(at: indexPath) as? EditScreenTableViewCell
        print("\(String(describing: cell?.seatID!.text))")
        print("\(String(describing: cell?.studentName!.text))")
        if (cell?.studentName.hasText ?? false){
            cell!.seatID!.text = cell!.studentName!.text
            print("working")
            TableView.reloadData()
        }
        ClassArray().archive(fileName: "HomeScreen")
    }
}
