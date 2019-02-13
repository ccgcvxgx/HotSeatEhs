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
    
    init(name: String, rows: Int, columns: Int){
        self.name = name
        rowDimension = rows
        columnDimension = columns
        super.init()
        fillPeriod()
    }
    
    func fillPeriod() {
        for i in 0..<rowDimension{
            for j in 0..<columnDimension{
                let seat = Seat(i,j)
                seatingChart.append(seat)
            }
        }
    }
    
    func fill(p: Period) -> [Seat] {
        for i in 0..<rowDimension{
            for j in 0..<columnDimension{
                let seat = Seat(i,j)
                seatingChart.append(seat)
            }
        }
        var chart = seatingChart
        return chart
    }
    
    
    private enum CodingKeys: CodingKey{
        case name
        case rowDimension
        case columnDimension
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(rowDimension, forKey: .rowDimension)
        try container.encode(columnDimension, forKey: .columnDimension)
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        rowDimension = try values.decode(Int.self, forKey: .rowDimension)
        columnDimension = try values.decode(Int.self, forKey: .columnDimension)
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

