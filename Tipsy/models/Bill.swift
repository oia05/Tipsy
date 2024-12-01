//
//  Bill.swift
//  Tipsy
//
//  Created by Omar Assidi on 01/12/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

struct Bill {
    var total: Double = 0.0
    var tip: Tip = .zero
    var split: Int = 1
    var totalPerPerson: Double = 0.0
    
}

enum Tip: String {
    case zero = "0%"
    case ten = "10%"
    case twenty = "20%"
    
    func getTipValue() -> Double {
        switch self {
        case .zero: return 0.0
        case .ten: return 0.1
        case .twenty: return 0.2
        }
    }
}
