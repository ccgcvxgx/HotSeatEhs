 //
 //  RunScreen.swift
 //  HotSeatEhs
 //
 //  Created by Andrea on 12/29/18.
 //  Copyright © 2018 district196.org. All rights reserved.
 //
 
 import UIKit
 
 class RunScreen: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var perName: UILabel!
    
    @IBOutlet weak var runCollection: UICollectionView!
    var collectionCell: [Seat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let name = list[classIndex].name
        perName.text = name
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionCell = list[classIndex].seatingChart
        return collectionCell.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collection = list[classIndex]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RunScreenCollectionViewCell", for: indexPath) as! RunScreenCollectionViewCell
        let s = collection.seatingChart[indexPath.row]
        cell.backgroundColor = UIColor.white
        if s.studentName != ""{
            cell.cellID.text = s.studentName
        }
        else{
            cell.cellID.text = s.id
            
        }
        let color = s.backColor as! String
        
        if (color == "red") {
            cell.backgroundColor = UIColor.red
            
        }
        else if (color == "white") {
            cell.backgroundColor = UIColor.white
            
        }
        else{
            cell.backgroundColor = UIColor.brown
            
        }
        
        return cell
    }
    
    func onSave (_ g: UITextField, _ p: UITextField) -> Void {
        let groups = Int(g.text!)
        let people = Int(p.text!)
    }
    
    @IBAction func runButton(_ sender: Any) {
        
        for i in stride(from: 0, through: list[classIndex].seatingChart.count-1, by: 1){
            list[classIndex].seatingChart[i].backColor = "white"
        }
        
        
        if groupChosen == "Single Seat" {
            let rand = Int.random(in: 0...list[classIndex].seatingChart.count - 1)
            let cell = list[classIndex].seatingChart[rand]
            cell.backColor = "red"
            runCollection.reloadData()
            //performSegue(withIdentifier: "SingleSeatSegue", sender: self)
        }
        
        if groupChosen == "Row" {
            
            let rand = Int.random(in: 0...4)
            let rowStart = 7 * rand
            for i in 0...6 {
                let cell = list[classIndex].seatingChart[rowStart+i]
                cell.backColor = "red"
                runCollection.reloadData()
            }
            
            
            //performSegue(withIdentifier: "RowColumnSegue", sender: self)
        }
        if groupChosen == "Column"{
            
        }
        if groupChosen == "RandomGroup" {
            performSegue(withIdentifier: "GroupPropertiesPopUp", sender: self)
        }
    }
    
    
 }
 
 
