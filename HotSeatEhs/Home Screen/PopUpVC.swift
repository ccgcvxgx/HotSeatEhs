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
        if (Name.text != "" && Rows.text != "" && Columns.text != "")
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
