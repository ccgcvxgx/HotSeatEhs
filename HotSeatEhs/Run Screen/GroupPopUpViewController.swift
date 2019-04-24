//
// GroupPopUpViewController.swift
//  HotSeatEhs
//
//  Created by Sydney on 2/5/19.
//  Copyright © 2019 district196.org. All rights reserved.
//


import UIKit

class GroupPopUpViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var popUp: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var groupTypeLabel: UILabel!
    var chosenGroupIndex = 0
    
    var chosenGroup = "Single Seat"
    var groupArray = ["Single Seat", "Row", "Column", "Random Group"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return groupArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return groupArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chosenGroup = groupArray[row]
        chosenGroupIndex = row
        groupChosen = chosenGroup
    }
    
    @IBAction func onSave(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func XButton(_ sender: UIButton) {
        dismiss(animated:true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.selectRow(chosenGroupIndex, inComponent: 0, animated: true)
        popUp.layer.cornerRadius = 10
    }
    
}













