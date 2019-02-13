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
    
    
    private func makeclasses() -> [Period]{
        let p1 = Period(name:"One",rows: 5, columns: 7)
        let p2 = Period(name:"Two",rows: 5, columns: 7)
        let p3 = Period(name:"Three",rows: 5, columns: 7)
        
        
        return [p1,p2,p3]
    }
    /*
     func collectionArr() -> [EditScreenCollection] {
     let cell1 = EditScreenCollection(cellID: "A1")
     let cell2 = EditScreenCollection(cellID: "A2")
     let cell3 = EditScreenCollection(cellID: "A3")
     let cell4 = EditScreenCollection(cellID: "A4")
     
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
     */

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let table = Period(name:"One",rows: 5, columns: 7)
        let cell = tableView.dequeueReusableCell(withIdentifier: "EditScreenTableViewCell", for: indexPath) as! EditScreenTableViewCell
        
        cell.seatID.text = "A1"
        cell.studentName.text = "Andrea"
        cell.textLabel?.text = table.seatingChart[indexPath.row].studentName
        
        return cell
            }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionCells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collection = Period(name:"One",rows: 5, columns: 7)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EditScreenCollectionViewCell", for: indexPath) as! EditScreenCollectionViewCell
        
           cell.cellID.text = collection.seatingChart[indexPath.row].studentName
        
        return cell
    }
}
