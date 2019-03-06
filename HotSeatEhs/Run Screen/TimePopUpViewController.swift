//
//  TimePopUpViewController.swift
//  HotSeatEhs
//
//  Created by Sydney on 2/26/19.
//  Copyright © 2019 district196.org. All rights reserved.
//

import UIKit

class TimePopUpViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var TimePicker: UIPickerView!
    

    @IBOutlet weak var timeLabel: UILabel!
    
    var chosenTime = "1"
    var timeArray = ["1","2","3","4","5","6","7","8","9","10"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return timeArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return timeArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chosenTime = timeArray[row]
        timeLabel.text = "Chosen: " + chosenTime
    }
    
    @IBAction func onSave(_ sender: UIButton) {
        dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
}
