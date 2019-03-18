//
//  Period.swift
//  HotSeatEhs
//
//  Created by Sydney on 12/11/18.
//  Copyright © 2018 district196.org. All rights reserved.
//
import UIKit

class Period: NSObject, Codable {
    
    //properties
    var name: String!
    var rowDimension: Int!
    var columnDimension: Int!
    var seatingChart = [Seat]()
    var time: Double
    var groupAmount: Int
    var randomIndex: Int
    
    
    init(name: String, rows: Int, columns: Int){
        self.name = name
        rowDimension = rows
        columnDimension = columns
        time = 5.0
        groupAmount = 2
        randomIndex = 99
        super.init()
        seatList = seatArr()
        
    }
    
    func chooseSeat() -> Seat {
        var chosenSeat = Seat(9,9)
        for _ in stride(from: 0.0, to: time, by: 0.4) {
            for j in 0..<seatingChart.count{
                chosenSeat = seatingChart[j]
            }
            
        }
        return chosenSeat
    }
    
    //function to choose a single row
    func chooseRow() -> Int {
        var chosenRow = 99
        for _ in stride(from: 0.0, to: time, by: 0.4){
            for j in 0..<seatingChart.count{
                chosenRow = seatingChart[j].rowPosition
            }
            
        }
        return chosenRow
    }
    
    //function to choose a single column
    func chooseColumn() -> Int {
        var chosenColumn = 99
        
        for _ in stride(from: 0.0, to: time, by: 0.4){
            for j in 0..<seatingChart.count{
                chosenColumn = seatingChart[j].columnPosition
            }
            
        }
        return chosenColumn
    }
    
    //function to choose a random group
    func chooseGroup(seatingChart: [Seat], groupAmount: Int) -> [[Seat]] {
        var total2D = [[Seat(9,9)]]
        var chosenGroup: [Seat]
        var tempArray: [Seat] = seatingChart
        for _ in 1...(groupAmount){
            chosenGroup = []
            let count: Int = tempArray.count
            randomIndex = Int.random(in: 0..<count)
            chosenGroup.append(tempArray[randomIndex])
            tempArray.remove(at: randomIndex)
            total2D.append(chosenGroup)
        }
        return total2D
    }
    
    func seatArr() -> [Seat] {
        for i in 1..<(rowDimension+1){
            for j in 1..<(columnDimension+1){
                let seat = Seat(i,j)
                seatingChart.append(seat)
                /*seatIndex = seatingChart.firstIndex(of: seat) ?? 0
                 seatingChart[seatIndex].rowPosition = i
                 seatingChart[seatIndex].columnPosition = j*/
            }
        }
        return seatingChart
    }
    private enum CodingKeys: CodingKey{
        case name
        case rowDimension
        case columnDimension
        case time
        case groupAmount
        case randomIndex
        case seatingChart
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(rowDimension, forKey: .rowDimension)
        try container.encode(columnDimension, forKey: .columnDimension)
        try container.encode(time, forKey: .time)
        try container.encode(groupAmount, forKey: .groupAmount)
        try container.encode(randomIndex, forKey: .randomIndex)
        try container.encode(seatingChart, forKey: .seatingChart)
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        rowDimension = try values.decode(Int.self, forKey: .rowDimension)
        columnDimension = try values.decode(Int.self, forKey: .columnDimension)
        time = try values.decode(Double.self, forKey: .time)
        groupAmount = try values.decode(Int.self, forKey: .groupAmount)
        randomIndex = try values.decode(Int.self, forKey: .randomIndex)
        seatingChart = try values.decode([Seat].self, forKey: .seatingChart)
    }
    
    
    //The Archive function will save all instance variables in a class, or will save all the variables declared in the CodingKeys enum if you have made a CodingKeys Enum. Replace [Period] with the name of the class this function is inside of.
    func archive(fileName: String) {
        print("Attempting Period archive...")
        let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent(fileName)
        do {
            let encodedData = try PropertyListEncoder().encode(self)
            let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(encodedData, toFile: archiveURL.path)
            if isSuccessfulSave {
                print("Period successfully saved to file.")
            } else {
                print("Failed to save Period")
            }
        } catch {
            print("Failed to save Period")
        }
    }
    
    //The Restore function will create a temporary version of this class (named recoveredData) that has all the information of the previously saved class. Restores that information by simply copying it to this class's variables
    func restore(fileName: String) {
        print("Attempting Period restore")
        let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent(fileName)
        if let recoveredDataCoded = NSKeyedUnarchiver.unarchiveObject(
            withFile: archiveURL.path) as? Data {
            do {
                let recoveredData = try PropertyListDecoder().decode(Period.self, from: recoveredDataCoded)
                name = recoveredData.name
                rowDimension = recoveredData.rowDimension
                columnDimension = recoveredData.columnDimension
                time = recoveredData.time
                groupAmount = recoveredData.groupAmount
                randomIndex = recoveredData.randomIndex
                seatingChart = recoveredData.seatingChart
                //...    <- Add more variables as necessary.
                print("[Period] successfully recovered from file.")
            } catch {
                print("Failed to recover Period")
            }
        } else {
            print("Failed to recover Period")
        }
    }
    
}







