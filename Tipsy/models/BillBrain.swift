//
//  TipBrain.swift
//  Tipsy
//
//  Created by Omar Assidi on 01/12/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

struct BillBrain {
    private var bill: Bill = Bill()
    
    mutating func setTip(_ tip: Tip) {
        bill.tip = tip
    }
    
    mutating func setSplit(_ split: Int) {
        bill.split = split
    }
    
    mutating func setTotal(_ total: Double) {
        bill.total = total
    }
    
    mutating func calculateTotalPerPerson() {
        let total = bill.total + (bill.total * bill.tip.getTipValue())
        let totalPerPerson = total / Double(bill.split)
        bill.totalPerPerson = totalPerPerson
    }
    
    func getSplit() -> Int {
        return bill.split
    }
    
    func getTip() -> Tip {
        return bill.tip
    }
    
    func getTotalPerPerson() -> Double {
        return bill.totalPerPerson
    }
}
