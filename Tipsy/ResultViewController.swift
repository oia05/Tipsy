//
//  ResultViewController.swift
//  Tipsy
//
//  Created by OmarAssidi on 18/10/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    var result: Float = 0.0
    var tip: String = "10%"
    var split: Int = 0
    
    override func viewDidLoad() {
        settingLabel.text = "Split between \(split) people, with \(tip) tip."
        totalLabel.text = String(result)
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
