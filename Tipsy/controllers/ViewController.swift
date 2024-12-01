//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var splitBillLabel: UILabel!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var zeroPercentButton: UIButton!
    
    private var billBrain = BillBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        let tip: Tip
        switch sender.titleLabel?.text {
        case Tip.zero.rawValue:
            tip = .zero
        case Tip.ten.rawValue:
            tip = .ten
        case Tip.twenty.rawValue:
            tip = .twenty
        default:
            tip = .zero
        }
        billBrain.setTip(tip)
        updateTipUi()
    }
    
    @IBAction func splitChanged(_ sender: UIStepper) {
        let split = Int(sender.value)
        billBrain.setSplit(split)
        updateSplitUi()
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        guard let total = Double(billTextField?.text ?? "") else { return }
        billBrain.setTotal(total)
        billBrain.calculateTotalPerPerson()
        billTextField.endEditing(true)
        navigateToResult()
    }
    
    private func updateTipUi() {
        let tip = billBrain.getTip()
        zeroPercentButton.isSelected = tip == .zero
        twentyPercentButton.isSelected = tip == .twenty
        tenPercentButton.isSelected = tip == .ten
        billTextField.endEditing(true)
    }
    
    private func updateSplitUi() {
        let split = billBrain.getSplit()
        splitBillLabel.text = String(split)
        billTextField.endEditing(true)
    }
    
    private func updateUi() {
        updateTipUi()
        updateSplitUi()
    }
    
    private func navigateToResult() {
        performSegue(withIdentifier: "toResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult" {
            let destination = segue.destination as! ResultViewController
            destination.totalperperson = billBrain.getTotalPerPerson()
            destination.split = billBrain.getSplit()
            destination.tip = billBrain.getTip().getTipValue()
        }
    }
}

