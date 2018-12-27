//
//  HomeScreenList.swift
//  HotSeatEhs
//
//  Created by Sydney on 12/27/18.
//  Copyright © 2018 district196.org. All rights reserved.
//

import UIKit

class HomeScreenList: UIViewController {
    
    var periods: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        periods = createArray()
    }
    func createArray() -> [String] {
        let period1 = "Period One"
        let period2 = "PeriodTwo"
        let period3 = "PeriodThree"
        let period4 = "PeriodFour"
        let period5 = "PeriodFive"
        let period6 = "PeriodSix"
        let period7 = "PeriodSeven"
        
        periods.append(period1)
        periods.append(period2)
        periods.append(period3)
        periods.append(period4)
        periods.append(period5)
        periods.append(period6)
        periods.append(period7)
        
        return periods
    }
}

extension HomeScreenList: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return periods.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let p = periods[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeScreenCell") as! HomeScreenCell
        return cell
    }
    
}

