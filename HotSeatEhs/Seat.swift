//
//  Seat.swift
//  HotSeatEhs
//
//  Created by Sydney on 12/11/18.
//  Copyright © 2018 district196.org. All rights reserved.
//

import UIKit

class Seat: NSObject {
    //properties
    var r: Int!
    var c: Int!
    var studentName: String?
    
    init(r: Int, c: Int , studentName: String?){
        self.r = r
        self.c = c
        self.studentName = studentName
    }
}
