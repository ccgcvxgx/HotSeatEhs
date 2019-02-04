//
//  Period.swift
//  HotSeatEhs
//
//  Created by Sydney on 12/11/18.
//  Copyright © 2018 district196.org. All rights reserved.
//

import UIKit

class Period {
    
    //properties
    var name: String!
    var seatingChart = [Seat]()
    var rowDimension: Int!
    var columnDimension: Int!
    var columns = [Int:[Any]]()
    var rows = [Int:[Any]]()
    
    init(name: String, rows: Int, columns: Int){
        self.name = name
        rowDimension = rows
        columnDimension = columns
        let seatCount = rowDimension * columnDimension
        seatingChart = [Seat](repeating: Seat(10,8), count: seatCount)
    }
    func fillPeriod() -> [Seat]{
        var fillPeriod = [Seat]()
        for i in 0..<columnDimension{
            for j in 0..<rowDimension{
                let s = Seat(i, j)
                fillPeriod.append(s)
            }
        }
        return fillPeriod
    }
}

