//
//  Setting.swift
//  rich
//
//  Created by Jim Chuang on 2018/12/4.
//  Copyright © 2018 nhr. All rights reserved.
//

import Foundation

var personArr = Array<Person>()
var houseArr = Array<House>()

var p1PassCount = 0
var p2PassCount = 0
var priceLevel = 1

class GC{
    static let share = GC()

    func initial(){

        personArr.removeAll()
        houseArr.removeAll()
        priceLevel = 1
        p1PassCount = 0
        p2PassCount = 0
        
        for _ in 0...2{
            let p = Person()
            p.owerCash = 400
            p.position = 0
            personArr.append(p)
        }

        for _ in 0...39{
            let h = House()
            h.landPrice = 10
            h.buildPrice = 5
            h.owner = 0
            houseArr.append(h)
        }

    }

    func getForwardNum() ->Int{
        let rand1 = arc4random_uniform(6) + 1
        let rand2 = arc4random_uniform(6) + 1
        let result = Int(rand1 + rand2)
        return result
    }

    func buildHouse(p:Int) -> Bool{
        if p == 1 || p == 2{
            let position = personArr[p].position

            // land
            if houseArr[position].owner != p{
                if personArr[p].owerCash >= houseArr[position].landPrice{
                    personArr[p].owerCash -= houseArr[position].landPrice
                    houseArr[position].owner = p
                    personArr[p].owerLand.append(position)
                    return true
                }
            }

            // build
            else{
                if personArr[p].owerCash >= houseArr[position].buildPrice{
                    if houseArr[position].buildHouse(){
                        personArr[p].owerCash -= houseArr[position].buildPrice
                        return true
                    }
                }
            }

        }
        return false
    }

    func checkHouseOwner(p:Int) -> Int?{
        if p == 1 || p == 2{
            let position = personArr[p].position
            return houseArr[position].owner
        }else{
            return nil
        }
    }

    func changePosition(position:Int, p:Int){
        personArr[p].position = position
    }

    func goAhead(p:Int){
        let step = getForwardNum()
        let position = personArr[p].position + step
        if position >= 40 {
            personArr[p].position = position % 40
            personArr[p].owerCash += 20
            if p == 1{
                p1PassCount += 1
            }else if p == 2{
                p2PassCount += 1
            }
        }else{
            personArr[p].position = position
        }
    }

    func payTolls(payP:Int,receiveP:Int){
        let position = personArr[payP].position
        let price = (houseArr[position].houseLevel * 5 + 5) * priceLevel

        personArr[payP].owerCash -= price
        personArr[receiveP].owerCash += price
    }

    func isOver(p:Int) -> Bool{
        return personArr[p].owerCash <= 0 ? true : false
    }



}


