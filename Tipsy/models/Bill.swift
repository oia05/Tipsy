//
//  Bill.swift
//  Tipsy
//
//  Created by OmarAssidi on 18/10/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation
enum Tip: String {
    case zero = "0%"
    case ten =  "10%"
    case twenty = "20%"
    
    func getValue() -> Float {
        let value: Float
        switch self {
        case .zero:
            value = 0.0
        case .ten:
            value = 0.1
        case .twenty:
            value = 0.2
        }
        return value
    }
}
struct Bill {
    var totalBill: Float
    var bill: Float
    var tip: Tip
    var split: Int
}
