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
        removeAnimate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        self.showAnimate()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
}
