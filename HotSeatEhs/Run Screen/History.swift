//
//  History.swift
//  HotSeatEhs
//
//  Created by YOUNG, TRENT on 4/26/19.
//  Copyright © 2019 district196.org. All rights reserved.
//

import Foundation

var historyS: Int!
var historyR: Int!
var historyC: Int!
var historyG: [Seat]!

class History: NSObject, Codable{
    
    override init() {
        super.init()
    }
    func callHistory(){
        if groupChosen == "Single Seat"{
            list[classIndex].seatingChart[historyS].backColor = "red"
        }
        else if groupChosen == "Row"{
            for i in 0...list[classIndex].columnDimension - 1 {
                let cell = list[classIndex].seatingChart[historyR+i]
                cell.backColor = "red"
            }
        }
        else if groupChosen == "Column"{
            for i in 0...list[classIndex].rowDimension - 1 {
                let cell = list[classIndex].seatingChart[historyC+(list[classIndex].columnDimension*i)]
                print(cell.id)
                cell.backColor = "red"
            }
        }
        else if groupChosen == "Random Group"{
            for i in 0...historyG.count-1{
                list[classIndex].seatingChart[i] = historyG[i]
                print(historyG[i].backColor)
                print(list[classIndex].seatingChart[i].backColor)
            }
            
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadHistory"), object: nil)
    
    }
}
