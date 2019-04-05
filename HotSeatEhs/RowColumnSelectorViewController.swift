//
//  ColumnSelectorViewController.swift
//  HotSeatEhs
//
//  Created by Andrea on 3/18/19.
//  Copyright © 2019 district196.org. All rights reserved.
//

import UIKit

class RowColumnSelectorViewController: UIViewController {

    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var names: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let per = list[classIndex]
        if groupChosen == "Row" {
            let s = per.chooseRow()
            let ID = "Row " + String(s)
            id.text = ID
            var rowNames = [String]()
            for i in 1..<(per.rowDimension + 1){
                for j in 1..<(per.columnDimension + 1) {
                    if j == s {
                        let student = Seat(i,j).studentName
                        rowNames.append(student!)
                    }
                }
            }
            var n = ""
            for i in 0..<rowNames.count{
                let r = rowNames[i]
               
                n = n + r + " 1"
            }
            names.text = n
        }
        if groupChosen == "Column" {
            let s = per.chooseColumn()
            let ID = "Column " + String(s)
            id.text = ID
            var colNames = [String]()
            for i in 1..<(per.columnDimension + 1){
                    if i == s {
                    for j in 1..<(per.rowDimension + 1) {
                        let student = Seat(j,i).studentName
                        colNames.append(student!)
                    }
                }
            }
            print (colNames.count)
            var n = ""
            for i in 0..<colNames.count{
                let r = colNames[i]
                n = n + r + "1 "
            }
            names.text = n
        // Do any additional setup after loading the view.
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
}
