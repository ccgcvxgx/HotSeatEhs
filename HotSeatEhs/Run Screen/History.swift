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


class History: NSObject, Codable{
    
    override init() {
        super.init()
    }
    func callHistory(){
        if groupChosen == "Random Group"{
            print(list[classIndex].seatingChart[5].backColor)
            print(historyG.seatingChart[5].backColor)
            for i in 0...historyG.seatingChart.count-1{
                list[classIndex].seatingChart[i] = historyG.seatingChart[i]
            }
        }
            
        else{
            RunScreen().whiteOut()
            if groupChosen == "Single Seat"{
                list[classIndex].seatingChart[historyS].backColor = "red"
            }
            else if groupChosen == "Row"{
                for i in 0...list[classIndex].columnDimension - 1 {
                    let cell = list[classIndex].seatingChart[historyR+i]
                    if cell.backColor != "darkGray"{
                        cell.backColor = "red"
                    }
                    
                }
            }
            else if groupChosen == "Column"{
                for i in 0...list[classIndex].rowDimension - 1 {
                    let cell = list[classIndex].seatingChart[historyC+(list[classIndex].columnDimension*i)]
                    if cell.backColor != "darkGray"{
                        cell.backColor = "red"
                    }
                }
            }
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadHistory"), object: nil)
        
    }
}
