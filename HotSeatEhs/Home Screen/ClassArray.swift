//
//  ClassArray.swift
//  HotSeatEhs
//
//  Created by YOUNG, TRENT on 2/4/19.
//  Copyright © 2019 district196.org. All rights reserved.
//

import Foundation
import UIKit

var list = [
    Period(name:"One",rows: 5, columns: 7),
    Period(name:"Two",rows: 5, columns: 7),
    Period(name:"Three",rows: 5, columns: 7),
    Period(name:"Four",rows: 5, columns: 7),
    Period(name:"Five",rows: 5, columns: 7),
    Period(name:"Six",rows: 5, columns: 7),
    Period(name:"Seven",rows: 5, columns: 7)
]

class ClassArray: NSObject, Codable {
    
    
    override init() {
        super.init()
        calsses = list
    }
    
    var calsses = list
    
    private enum CodingKeys: CodingKey{
        case calsses
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(calsses, forKey: .calsses)
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        list = try values.decode([Period].self, forKey: .calsses)
    }
    
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
                let recoveredData = try PropertyListDecoder().decode(ClassArray.self, from: recoveredDataCoded)
                list = recoveredData.calsses
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
