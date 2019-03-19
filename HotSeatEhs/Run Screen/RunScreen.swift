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
        cell.cellID.text = s.id
        
        return cell
    }
    
    @IBAction func runButton(_ sender: Any) {
        if groupChosen == "Single Seat" {
            performSegue(withIdentifier: "SingleSeatSegue", sender: self)
        }
        /*if groupChosen == "column" || groupChosen == "row" {
            performSegue(withIdentifier: <#T##String#>, sender: self)
        }*/
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
