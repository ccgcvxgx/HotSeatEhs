//
//  HomeScreenList.swift
//  HotSeatEhs
//
//  Created by Andrea on 12/27/18.
//  Copyright © 2018 district196.org. All rights reserved.
//

import UIKit

class HomeScreenList: UIViewController {
    
    var periods: [HomeScreen] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        periods = createArray()
    }
    func createArray() -> [HomeScreen] {
        let period1 = HomeScreen(periodName: "Period One")
        let period2 = HomeScreen(periodName: "PeriodTwo")
        let period3 = HomeScreen(periodName: "PeriodThree")
        let period4 = HomeScreen(periodName: "PeriodFour")
        let period5 = HomeScreen(periodName: "PeriodFive")
        let period6 = HomeScreen(periodName: "PeriodSix")
        let period7 = HomeScreen(periodName: "PeriodSeven")
        
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

