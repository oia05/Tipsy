//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Omar Assidi on 01/12/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    var totalperperson: Double!
    var split: Int!
    var tip: Double!
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(totalperperson)
        settingsLabel.text = "Split between \(split!) people, with \(tip * 100)% tip"
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true , completion: nil)
    }
}
