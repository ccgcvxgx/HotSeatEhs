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
    
    @IBOutlet weak var popUp: UIView!
    @IBOutlet weak var numberOfPeople: UITextField!
    var groups = ""
    var people = ""
    var onSave: ((_ g: UITextField, _ p: UITextField) -> Void)?
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        if(numberOfGroups.text == "1" || numberOfGroups.text == "2" || numberOfGroups.text == "3" || numberOfGroups.text == "4" || numberOfGroups.text == "5" || numberOfGroups.text == "6" || numberOfGroups.text == "7" || numberOfGroups.text == "8" || numberOfGroups.text == "9" || numberOfGroups.text == "10" || numberOfGroups.text == "11" || numberOfGroups.text == "12" || numberOfGroups.text == "13" || numberOfGroups.text == "14" || numberOfGroups.text == "15" || numberOfGroups.text == "16" || numberOfGroups.text == "17"){
            let tempPer = list[classIndex].seatingChart
            let per = tempPer.count
            let people = per / Int(numberOfGroups.text!)!
            numberOfPeople.text = String(people)
            RunScreen().onSave(numberOfGroups, numberOfPeople)
        }
        
        if (numberOfPeople.text == "1" || numberOfPeople.text == "2" || numberOfPeople.text == "3" || numberOfPeople.text == "4" || numberOfPeople.text == "5" || numberOfPeople.text == "6" || numberOfPeople.text == "7" || numberOfPeople.text == "8" || numberOfPeople.text == "9" || numberOfPeople.text == "10" || numberOfPeople.text == "11" || numberOfPeople.text == "12" || numberOfPeople.text == "13" || numberOfPeople.text == "14" || numberOfPeople.text == "15" || numberOfPeople.text == "16" || numberOfPeople.text == "17"){
            let tempPer = list[classIndex].seatingChart
            let per = tempPer.count
            let people = per / Int(numberOfPeople.text!)!
            numberOfGroups.text = String(people)
            RunScreen().onSave(numberOfGroups, numberOfPeople)
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        if(numberOfGroups.text == "1" || numberOfGroups.text == "2" || numberOfGroups.text == "3" || numberOfGroups.text == "4" || numberOfGroups.text == "5" || numberOfGroups.text == "6" || numberOfGroups.text == "7" || numberOfGroups.text == "8" || numberOfGroups.text == "9" || numberOfGroups.text == "10" || numberOfGroups.text == "11" || numberOfGroups.text == "12" || numberOfGroups.text == "13" || numberOfGroups.text == "14" || numberOfGroups.text == "15" || numberOfGroups.text == "16" || numberOfGroups.text == "17")
        {
            dismiss(animated: true)
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadGroup"), object: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        popUp.layer.cornerRadius = 10
    }
    
}
