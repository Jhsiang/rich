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
        var arr = [[1,2,3,4,5,6],
                   [1,2,3,4,5,6],
                   [1,2,3,4,5,6],
                   [1,2,3,4,5,6],
                   [1,2,3,4,5,6]]
        var arr2 = [1,2,3,4,5,6]

        NSLog("time1")

        for _ in 0...5999999{

            arr.swapAt([0][0], [1][0])
            //3.6
            /*
            (arr[1][1],arr[2][2]) = (arr[2][2],arr[1][1])
             */


            //3.5
            /*
            let a = arr[1][2]
            arr[1][2] = arr[2][2]
            arr[2][2] = a
            //swap(&arr[1][2], &arr[2][2])
             */

            //arr.swapAt(1, 2)


        }


        NSLog("time2")
    }

    func autoRun(){

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
                GC.share.priceLevel += 1
            }
        }

        print("round = ",round)
        if let p1OwnerLand = GC.share.getOwnerLand(p: 1), let p2OwnerLand = GC.share.getOwnerLand(p: 2){
            var p1value = 0
            var p2value = 0
            for position in p1OwnerLand{
                if let hr = GC.share.getHouse(position: position){
                    p1value +=  10 + 5 * hr.houseLevel
                }
            }

            for position in p2OwnerLand{
                if let hr = GC.share.getHouse(position: position){
                    p2value +=  10 + 5 * hr.houseLevel
                }
            }

            print("p1 = \(GC.share.getCash(p: 1)!) value = \(p1value) land count = \(p1OwnerLand.count)")
            print("p2 = \(GC.share.getCash(p: 2)!) value = \(p2value) land count = \(p2OwnerLand.count)")
            print("p1 pass count = \(GC.share.p1PassCount)")
            print("p2 pass count = \(GC.share.p2PassCount)")
        }
    }


}



