//
//  ViewController.swift
//  rich
//
//  Created by Jim Chuang on 2018/12/4.
//  Copyright © 2018 nhr. All rights reserved.
//

import UIKit


class ViewController: UIViewController,HouseDelegate {

    let P1 = 1
    let P2 = 2

    func buildLevelChagne(level: Int) {
        print("level = ",level)
    }

    override func viewDidLoad() {
        super.viewDidLoad()


        GC.share.initial()

        var round = 0
        while !GC.share.isOver(p: P1) && !GC.share.isOver(p: P2){
            round += 1
            //print(" \n\n\nround \(round)")

            // P1
            GC.share.goAhead(p: P1)
            if let ower = GC.share.checkHouseOwner(p: P1){
                if ower != P2{
                    if GC.share.buildHouse(p: P1){
                        // P1 build house
                    }else{
                        // P1 house full
                    }
                }else{
                    GC.share.payTolls(payP: P1, receiveP: P2)
                    // P1 pay Tolls
                }
            }

            if GC.share.isOver(p: P1){
                break
            }

            // P2
            GC.share.goAhead(p: P2)
            if let ower = GC.share.checkHouseOwner(p: P2){
                if ower != P1{
                    if GC.share.buildHouse(p: P2){
                        // P2 build house
                    }else{
                        // P2 house full
                    }
                }else{
                    GC.share.payTolls(payP: P2, receiveP: P1)
                    // P2 pay Tolls
                }
            }

            if GC.share.isOver(p: P2){
                break
            }

            if round % 100 == 0{
                priceLevel += 1
            }
        }

        print("round = ",round)
        let p1OwnerLand = personArr[1].owerLand
        let p2OwnerLand = personArr[2].owerLand

        var p1value = 0
        var p2value = 0
        for position in p1OwnerLand{
            p1value +=  10 + 5 * houseArr[position].houseLevel
        }

        for position in p2OwnerLand{
            p2value +=  10 + 5 * houseArr[position].houseLevel
        }


        print("p1 = \(personArr[1].owerCash) value = \(p1value) land count = \(p1OwnerLand.count)")
        print("p2 = \(personArr[2].owerCash) value = \(p2value) land count = \(p2OwnerLand.count)")
        print("p1 pass count = \(p1PassCount)")
        print("p2 pass count = \(p2PassCount)")
    }


}



