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
    
    var collectionCells: [EditScreenCollection] = []
    var tableCells: [EditScreenTable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionCells = collectionArr()
        tableCells = tableArr()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
        
        func collectionArr() -> [EditScreenCollection] {
        let cell1 = EditScreenCollection(cellID: "A1")
        let cell2 = EditScreenCollection(cellID: "A2")
        let cell3 = EditScreenCollection(cellID: "A3")
        let cell4 = EditScreenCollection(cellID: "A1")
        
        collectionCells.append(cell1)
        collectionCells.append(cell2)
        collectionCells.append(cell3)
        collectionCells.append(cell4)
        
        return collectionCells
    
    }
    
    func tableArr() -> [EditScreenTable] {
        let cell1 = EditScreenTable(seatID: "A1", studentName: "Andrea")
        let cell2 = EditScreenTable(seatID: "A2", studentName: "Sydney")
        let cell3 = EditScreenTable(seatID: "A3", studentName: "Trent")
        let cell4 = EditScreenTable(seatID: "A4", studentName: "Corinn")
        
        tableCells.append(cell1)
        tableCells.append(cell2)
        tableCells.append(cell3)
        tableCells.append(cell4)
        
        return tableCells
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let table = tableCells[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "EditScreenTableViewCell", for: indexPath) as! EditScreenTableViewCell
        //cell.seatID.text? = "A1"
        // cell.studentName.text? = "Andrea"
        return cell
            }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionCells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collection = collectionCells[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EditScreenCollectionViewCell", for: indexPath) as! EditScreenCollectionViewCell
        cell.cellID.text = "A1"
        return cell
    }
}
