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
    var seatNumber: Int!
    var seatingChart = [[Seat]]()
    var rowDimension: Int!
    var columnDimension: Int!
    var columns = [Seat]()
    var rows = [Seat]()
    
    init(n : String, seats: Int, rows: Int, columns: Int){
        name = n
        seatNumber = seats
        rowDimension = rows
        columnDimension = columns
    }
    //function to fill the period object with seats by using a 2D array
    func fillPeriod(Seats: Seat) -> Array<Any> {
        for i in 0..<rowDimension{
            for j in 0..<columnDimension {
                seatingChart[i][j] = Seat(i, j)
            }
        }
        return seatingChart
    }
    //function to make an array for the rows only
    func fillRows(Seats: Seat) -> Array<Any> {
        for i in 0..<rowDimension {
            for j in 0..<columnDimension {
                rows[i] = Seat(i, j)
            }
        }
        return rows
    }
    //function to make an array for the columns only
    func fillColumns(Seats: Seat) -> Array<Any> {
        for i in 0..<rowDimension {
            for j in 0..<columnDimension {
                columns[j] = Seat(i, j)
            }
        }
        return columns
}
}
