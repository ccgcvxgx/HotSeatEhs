//
//  Seat.swift
//  HotSeatEhs
//
//  Created by Sydney on 12/11/18.
//  Copyright © 2018 district196.org. All rights reserved.
//

import UIKit

class Seat: NSObject {
    //properties
    var rowPosition: Int!
    var columnPosition: Int!
    var studentName: String!
    
    
    init(_ row: Int, _ column: Int) {
        rowPosition = row
        columnPosition = column
    }
    //a function to combine the row and column identifiers to make a seatID
    func id(r: Int, c: Int) -> Int {
        let id = r + (c * 5)
        return id
    }
}
