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
    var numberOfRows: Int!
    var numberOfColumns: Int!
    // arrays to loop though for the slector functions
    var seats: [Seat] = []
    var rows: [Any] = []
    var colunms: [Any] = []
    
    
    init(n : String, seats: Int, rows: Int, columns: Int){
        name = n
        numberOfRows = rows
        numberOfColumns = columns
        
        for _ in stride(from: 1, through: (numberOfRows * numberOfColumns) + 1, by: 1){
            for colunm in stride(from: 1, through: numberOfColumns + 1, by: 1){
                    for row in stride(from: 1, through: numberOfRows + 1, by: 1){
                        self.seats.append(Seat(row, colunm))
                }
            }
        }
    }
}
