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
        if s.studentName != ""{
            cell.cellID.text = s.studentName
        }
        else{
            cell.cellID.text = s.id
            
        }
        
        return cell
    }
    
    
    @IBAction func runButton(_ sender: Any) {
        
        for cell in runCollection.visibleCells as! [RunScreenCollectionViewCell] {
            cell.backgroundColor = UIColor.white
        }
        if groupChosen == "Single Seat" {
            let selected = runCollection.visibleCells.randomElement()
            selected!.backgroundColor = UIColor.red
            //performSegue(withIdentifier: "SingleSeatSegue", sender: self)
        }
        if groupChosen == "Row" {
            let max = list[classIndex].columnDimension - 1
            let rand = Int.random(in: 0...max)
            let rowStart = 0//+(rand*max)
            var seatChart = runCollection.visibleCells as! [RunScreenCollectionViewCell]
            /*
             for i in 0...max {
             //seatChart[rowStart + bump].backgroundColor = UIColor.red
             seatChart[i].backgroundColor = UIColor.purple
             print(seatChart[i].cellID.text)
             }*/
            for i in 0...runCollection.visibleCells.count - 1{
                print(list[classIndex].seatingChart[i].flag)
                print(list[classIndex].seatingChart[i].id)
                
            }
            
            
            //performSegue(withIdentifier: "RowColumnSegue", sender: self)
        }
        if groupChosen == "Column"{
            
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
