//
//  GroupPropertiesPopUpViewController.swift
//  HotSeatEhs
//
//  Created by Andrea on 4/10/19.
//  Copyright © 2019 district196.org. All rights reserved.
//

import UIKit

class GroupPropertiesPopUpViewController: UIViewController {
    @IBOutlet weak var numberOfGroups: UITextField!
    
    @IBOutlet weak var numberOfPeople: UITextField!
    var groups = ""
    var people = ""
    var onSave: ((_ g: UITextField, _ p: UITextField) -> Void)?
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        if(numberOfGroups.text != ""){
            let tempPer = list[classIndex].seatingChart
            let per = tempPer.count
            let people = per / Int(numberOfGroups.text!)!
            numberOfPeople.text = String(people)
            RunScreen().onSave(numberOfGroups, numberOfPeople)
        }
        if (numberOfPeople.text != ""){
            let tempPer = list[classIndex].seatingChart
            let per = tempPer.count
            let people = per / Int(numberOfPeople.text!)!
            numberOfGroups.text = String(people)
            RunScreen().onSave(numberOfGroups, numberOfPeople)
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
