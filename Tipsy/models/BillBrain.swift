//
//  BillBrain.swift
//  Tipsy
//
//  Created by OmarAssidi on 18/10/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct BillBrain {
    var bill: Bill
    
    mutating func setTip(tip: Tip) {
        bill.tip = tip
    }
    
    mutating func setSplit(split: Int) {
        bill.split = split
    }
    
    mutating func setBill(bill: Float) {
        self.bill.bill = bill
    }
    
    mutating func calculateTotalBill() {
        let billValue = self.bill.bill
        self.bill.totalBill = (billValue + (billValue * bill.tip.getValue()))/Float(bill.split)
    }
    
}
