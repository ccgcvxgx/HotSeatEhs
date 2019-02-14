//
//  RunPopUpVC.swift
//  HotSeatEhs
//
//  Created by Sydney on 2/5/19.
//  Copyright © 2019 district196.org. All rights reserved.
//


import UIKit

class RunPopUpViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var PickerView: UIPickerView!
    
    @IBOutlet weak var groupTypeLabel: UILabel!
    
    var chosenString: String!
    var groupTypes = ["Single", "Coulumn", "Row", "Random Group"]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return groupTypes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return groupTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chosenString = groupTypes[row]
        groupTypeLabel.text = "Chosen: " + chosenString
    }
    
    // var onPick: ((_ chosenString: String) -> Void)?
    
    
   
    @IBAction func onSave(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}












