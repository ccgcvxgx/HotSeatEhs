//
//  PopUpVC.swift
//  HotSeatEhs
//
//  Created by Andrea on 1/26/19.
//  Copyright © 2019 district196.org. All rights reserved.
//

import UIKit

class PopUpVC: UIViewController {
    
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Rows: UITextField!
    @IBOutlet weak var Columns: UITextField!
    @IBOutlet weak var popUp: UIView!
    
    
    
    var onAdd: ((_ n: UITextField, _ r: UITextField, _ c: UITextField) -> Void)?
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        popUp.layer.cornerRadius = 10
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        popUp.layer.cornerRadius = 10
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addClose(_ sender: UIButton) {
        if (Name.text != "" &&
            (Rows.text == "1" || Rows.text == "2" || Rows.text == "3" || Rows.text == "4" || Rows.text == "5" || Rows.text == "6" || Rows.text == "7" || Rows.text == "8" || Rows.text == "9" || Rows.text == "10" ) &&
            (Columns.text == "1" || Columns.text == "2" || Columns.text == "3" || Columns.text == "4" || Columns.text == "5" || Columns.text == "6" || Columns.text == "7" || Columns.text == "8" || Columns.text == "9" || Columns.text == "10" ))
        {
            HomeViewController().onAdd(Name, Rows, Columns)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
            dismiss(animated: true)
        }
        
    }
    
    @IBAction func XButton(_ sender: UIButton) {
        dismiss(animated:true)
    }
}
