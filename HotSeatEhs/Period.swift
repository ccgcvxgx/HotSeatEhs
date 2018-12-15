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
    
    init(n : String,rows: Int, columns: Int){
        name = n
        numberOfRows = rows
        numberOfColumns = columns
        
        // seats filler
        for colunm in stride(from: 0, to: numberOfColumns, by: 1){
            // starts at 0 for the id maker to work
            for row in stride(from: 1, through: numberOfRows, by: 1){
                self.seats.append(Seat(row, colunm))
            }
        }
        // rows filler
        for _ in stride(from: 0, to: numberOfRows * numberOfColumns, by: numberOfColumns){
            var temp: [Any] = []
            for x in stride(from: 0, through: numberOfColumns, by: 1){
                temp.append(self.seats[x])
            }
            self.rows.append(contentsOf: temp)
        }
        // column filler
        for _ in stride(from: 0, to: numberOfRows * numberOfColumns, by: numberOfRows){
            var temp: [Any] = []
            for x in stride(from: 0, through: numberOfRows, by: 1){
                temp.append(self.seats[x])
            }
            self.colunms.append(contentsOf: temp)
        }
        print(self.seats)
        print(self.rows)
        print(self.colunms)
    }
}
