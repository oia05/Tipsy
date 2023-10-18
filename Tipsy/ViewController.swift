//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    var billBrain = BillBrain(bill: Bill(totalBill: 0.0, bill: 0.0, tip: .ten, split: 1))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func splitChanged(_ sender: UIStepper) {
        self.splitNumberLabel.text = String(format: "%.0f", sender.value)
        billBrain.setSplit(split: Int(sender.value))
    }
    
    @IBAction func tipPressed(_ sender: UIButton) {
        billTextField.endEditing(true)
        switch sender.currentTitle {
        case Tip.zero.rawValue:
            billBrain.setTip(tip: .zero)
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        case Tip.ten.rawValue:
            billBrain.setTip(tip: .ten)
            tenPctButton.isSelected = true
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
        default:
            billBrain.setTip(tip: .twenty)
            twentyPctButton.isSelected = true
            tenPctButton.isSelected = false
            zeroPctButton.isSelected = false
            
        }
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = Float(billTextField.text ?? "0") ?? 0
        billBrain.setBill(bill: bill)
        billBrain.calculateTotalBill()
        performSegue(withIdentifier: "resultSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = billBrain.bill.totalBill
            destinationVC.split = billBrain.bill.split
            destinationVC.tip = billBrain.bill.tip.rawValue
            
        }
    }
}

