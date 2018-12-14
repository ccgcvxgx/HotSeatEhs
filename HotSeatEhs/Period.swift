//
//  Period.swift
//  HotSeatEhs
//
//  Created by Sydney on 12/11/18.
//  Copyright © 2018 district196.org. All rights reserved.
//

import UIKit

class Period: NSObject {
//properties
    var name: String!
    var seatNumber: Int!
    var validSeatingChart: Seat!
    var rowDimension: Int!
    var columnDimension: Int!
    
    init(n : String, seats: Int, rows: Int, columns: Int){
        name = n
        seatNumber = seats
        rowDimension = rows
        columnDimension = columns
    }
    
    //array that fills the period with seats
    var fill = [Seat]()
    }
