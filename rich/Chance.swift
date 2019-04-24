//
//  Chance.swift
//  rich
//
//  Created by Jim Chuang on 2018/12/6.
//  Copyright © 2018 nhr. All rights reserved.
//

import Foundation

class Chance{

    static let share = Chance(5)

    private var dic = Dictionary<Int,String>()
    private var arr = Array<Int>()
    private let strArr =
        ["url1",
         "url2",
         "url3"]

    init(_: Any) {
        for x in 0...15{
            arr.append(x)
            dic[x] = strArr[x]
        }
        arr.shuffle()
    }

    func takeFirst() -> String{
        let firstNum = arr.first!
        let str = dic[firstNum]
        arr.removeFirst()
        arr.append(firstNum)
        return str!
    }

    func effect(){
        var changePosition = false
        var changeCash = false
        var stopRound = 0
    }
    


}

class Fate{

}







/*
 「擊落共匪米格機，得獎金3000元」,
 「檢舉間諜，得獎金2000元」,
 「經營小本生意，獲利1000元」,
 「繳赴美留學保證金，2400元」,
 「付學費，1500元」,
 「整修自己所有房屋，房屋每棟250元、旅館每棟1000元」,
 「付戶稅，房屋每棟400元、旅館每棟1150元」,
 「前進到博愛路，如經過『由此去』得2000元」,
 「前進到民族路，如經過『由此去』得2000元」,
 「直達台中車站，如經過『由此去』得2000元」,
 「銀行付你利息，500元」,
 「行車超速，罰款150元」,
 「酗酒鬧事，罰款200元」,
 「出獄許可證，此證可保留,或出售」,
 「拘票-立刻坐牢，不得經『由此去』」,
 「運動跳水冠軍，得獎金1000元」
 */

/*
 「敬軍愛國，捐款1000元」
 「中『愛國獎券』五獎，得2000元」
 「當棉被一條，得500元」
 「賣『黃牛票』，罰款1000元或取"機會"一張」
 「路不拾遺失主酬勞，得1000元」
 「出獄許可證，此證可保留或出售」
 「婦產科醫院，1000元」
 「整修自己所有房屋，房屋每棟250元、旅館每棟1000元」
 「選美會獲得亞軍，得100元」
 「拘票-立刻坐牢，不得經『由此去』」
 「小偷光顧，損失500元」
 「工作努力，得獎金2000元」
 「付保險費，500元」
 「這是你的生日，向每人收取禮金100元」
 「得美國華盛頓大學，獎學金2000元」
 */
