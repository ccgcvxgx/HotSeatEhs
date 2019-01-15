//
//  Selectors.swift
//  HotSeatEhs
//
//  Created by Sydney on 1/4/19.
//  Copyright © 2019 district196.org. All rights reserved.
//

import UIKit

class Selectors {
    
    
    let seatsArray: [Seat]
    var time: Int = 5
    var timeCount: Double = 0.0
    var chosenSeat: Seat
    var chosenRow: Int
    var chosenColumn: Int
    var chosenGroup: [Seat]
    var groupAmount: Int
    var random: Int
    var total2D: [[Seat]]
    
    
    //function to choose a single seat
    init (seatArray: [Seat], time: Int, timeCount: Double, chosenSeat: Seat, chosenRow: Int, chosenColumn: Int, chosenGroup: [Seat], groupAmount: Int, random: Int, total2D: [[Seat]]){
        self.seatsArray = seatArray
        self.time = time
        self.timeCount = timeCount
        self.chosenSeat = chosenSeat
        self.chosenRow = chosenRow
        self.chosenColumn = chosenColumn
        self.chosenGroup = chosenGroup
        self.groupAmount = groupAmount
        self.random = random
        self.total2D = total2D
    }
    
    func chooseSeat(seatsArray: [Seat], time: Int) -> Seat {
        for _ in 0...(time){
            for j in 1..<seatsArray.count{
                timeCount = timeCount + 0.4
                chosenSeat = seatsArray[j]
            }
            
        }
        return chosenSeat
    }
    
    //function to choose a single row
    func chooseRow(seatsArray: [Seat], time: Int) -> Int {
        for _ in 0...(time){
            for j in 1..<seatsArray.count{
                timeCount = timeCount + 0.4
                chosenRow = seatsArray[j].rowPosition
            }
            
        }
        return chosenRow
    }
    
    //function to choose a single column
    func chooseColumn(seatsArray: [Seat], time: Int) -> Int {
        for _ in 0...(time){
            for j in 1..<seatsArray.count{
                timeCount = timeCount + 0.4
                chosenColumn = seatsArray[j].columnPosition
            }
            
        }
        return chosenColumn
    }
    
    //function to choose a random group
    func chooseGroup(seatsArray: [Seat], groupAmount: Int) -> [[Seat]] {
        var tempArray: [Seat] = seatsArray
        for _ in 1...(groupAmount){
            chosenGroup = []
            let count: Int = tempArray.count
            random = Int.random(in: 0..<count)
            chosenGroup.append(tempArray[random])
            tempArray.remove(at: random)
            total2D.append(chosenGroup)
        }
        return total2D
    }
}




