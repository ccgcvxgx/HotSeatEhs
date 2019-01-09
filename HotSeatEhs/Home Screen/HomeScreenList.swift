//
//  HomeScreenList.swift
//  HotSeatEhs
//
//  Created by Sydney on 12/27/18.
//  Copyright © 2018 district196.org. All rights reserved.
//

import UIKit

class HomeScreenList: UIViewController{
    var periods: [HomePeriods] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        periods = createArray()
    }
    
    func createArray() -> [HomePeriods] {
        var tempPeriods: [HomePeriods] = []
        let period1 = HomePeriods(periodName: "Period One")
        let period2 = HomePeriods(periodName: "Period Two")
        let period3 = HomePeriods(periodName: "Period Three")
        let period4 = HomePeriods(periodName: "Period Four")
        
        tempPeriods.append(period1)
        tempPeriods.append(period2)
        tempPeriods.append(period3)
        tempPeriods.append(period4)
        return tempPeriods
    }

    
}

