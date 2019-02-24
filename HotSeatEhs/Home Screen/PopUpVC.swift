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
    
    var onAdd: ((_ n: UITextField, _ r: UITextField, _ c: UITextField) -> Void)?

    @IBAction func addClose(_ sender: UIButton) {
        onAdd?(Name, Rows, Columns)
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
