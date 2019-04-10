//
//  Seat.swift
//  HotSeatEhs
//
//  Created by Sydney on 12/11/18.
//  Copyright © 2018 district196.org. All rights reserved.
//
import UIKit

class Seat: NSObject, Codable {
    //properties
    var rowPosition: Int!
    var columnPosition: Int!
    var studentName: String!
    var id: String!
    var flag: Int!
    
    init( _ row: Int, _ column: Int, _ spot: Int) {
        rowPosition = row
        columnPosition = column
        studentName = ""
        id = String(column) + "." + String(row)
        flag = spot
    }
    /*func sName() -> String {
     }*/
}
