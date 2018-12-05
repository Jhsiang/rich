//
//  House.swift
//  rich
//
//  Created by Jim Chuang on 2018/12/4.
//  Copyright © 2018 nhr. All rights reserved.
//

import Foundation

protocol HouseDelegate {
    func buildLevelChagne(level:Int)
}

class House{
    static let share = House()
    var delegate:HouseDelegate?
    var landPrice = 0
    var buildPrice = 0
    var houseLevel = 0
    var owner = 0

    func buildHouse() -> Bool{
        if houseLevel < 5{
            houseLevel += 1
            self.delegate?.buildLevelChagne(level: houseLevel)
            return true
        }else{
            return false
        }
    }
}
