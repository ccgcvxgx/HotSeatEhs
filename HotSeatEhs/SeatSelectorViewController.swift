//
//  SeatSelectorViewController.swift
//  HotSeatEhs
//
//  Created by Andrea on 3/18/19.
//  Copyright © 2019 district196.org. All rights reserved.
//

import UIKit

class SeatSelectorViewController: UIViewController {
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var n: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let s = list[classIndex].chooseSeat()
        let ID = "Seat " + s.id
        var N = ""
        if(s.studentName != "" ){
             N = s.studentName
        }
        else{
             N = s.id
        }
        
        id.text = ID
        n.text = N
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
